import { filter, map, sortBy } from 'common/collections';
import { flow } from 'common/fp';
import { createSearch } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import { BlockQuote, Button, Flex, LabeledList, Icon, Input, Section, Table, Tabs, Stack, ProgressBar, Divider } from '../components';
import { TableCell, TableRow } from '../components/Table';
import { Window } from '../layouts';

type HeaderInfo = {
  isTargetSelf: boolean;
  interactingWith: string;
  selfAttributes: string[];
  theirAttributes: string[];
}

type ContentInfo = {
  interactions: InteractionData[];
}

type InteractionData = {
  key: string;
  desc: string;
  type: number;
}

type GenitalInfo = {
  genitals: GenitalData[];
}

type GenitalData = {
  name: string,
  key: string,
  visibility: string,
  extras: string,
  extra_choices: string[],
  possible_choices: string[],
  can_arouse: boolean,
  arousal_state: boolean,
}

type GenitalManagerInfo = {
  isTargetSelf: boolean;
  genital_fluids: GenitalFluid[];
  genital_interactibles: GenitalInteractionInfos[];
}

type GenitalInteractionInfos = {
  name: string,
  key: string,
  possible_choices: string[],
  equipments: string[],
}

type GenitalFluid = {
  name: string,
  key: string,
  fluids: number,
}

type CharacterPrefsInfo = {
  erp_pref: number,
  noncon_pref: number,
  vore_pref: number,
  extreme_pref: number,
  unholy_pref: number,
  extreme_harm: boolean,
}

type ContentPrefsInfo = {
  verb_consent: boolean,
  lewd_verb_sounds: boolean,
  arousable: boolean,
  genital_examine: boolean,
  vore_examine: boolean,
  medihound_sleeper: boolean,
  eating_noises: boolean,
  digestion_noises: boolean,
  trash_forcefeed: boolean,
  forced_fem: boolean,
  forced_masc: boolean,
  hypno: boolean,
  bimbofication: boolean,
  breast_enlargement: boolean,
  penis_enlargement: boolean,
  butt_enlargement: boolean,
  belly_inflation: boolean,
  never_hypno: boolean,
  no_aphro: boolean,
  no_ass_slap: boolean,
  no_auto_wag: boolean,
}

export const MobInteraction = (props, context) => {
  const { act, data } = useBackend<HeaderInfo>(context);
  const {
    isTargetSelf,
    interactingWith,
    selfAttributes,
    theirAttributes,
  } = data;
  const [tabIndex, setTabIndex] = useLocalState(context, 'tabIndex', 0);

  return (
    <Window
      width={530}
      height={700}
      resizable>
      <Window.Content overflow="auto">
        <Section title={interactingWith}>
          <Table>
            <Table.Cell>
              <BlockQuote>
                You...<br />
                {selfAttributes.map(attribute => (
                  <div key={attribute}>
                    {attribute}<br />
                  </div>
                ))}
              </BlockQuote>
            </Table.Cell>
            {!isTargetSelf ? (
              <Table.Cell>
                <BlockQuote>
                  They...<br />
                  {theirAttributes.map(attribute => (
                    <div key={attribute}>
                      {attribute}<br />
                    </div>
                  ))}
                </BlockQuote>
              </Table.Cell>
            ) : (null)}
          </Table>
        </Section>
        <Section>
          <Tabs fluid textAlign="center">
            <Tabs.Tab selected={tabIndex === 0} onClick={() => setTabIndex(0)}>
              Interactions
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 1} onClick={() => setTabIndex(1)}>
              Genital Options
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 2} onClick={() => setTabIndex(2)}>
              Character Prefs
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 3} onClick={() => setTabIndex(3)}>
              Preferences
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 4} onClick={() => setTabIndex(4)}>
              Genital Manager
            </Tabs.Tab>
          </Tabs>
          {tabIndex === 0 && (
            <InteractionsTab />
          ) || tabIndex === 1 && (
            <GenitalTab />
          ) || tabIndex === 2 && (
            <CharacterPrefsTab />
          ) || tabIndex === 3 && (
            <ContentPreferencesTab />
          ) || tabIndex === 4 && (
            <GenitalManagerTab />
          ) || ("Somehow, you've got into an invalid page, please report this.")}
        </Section>
      </Window.Content>
    </Window>
  );
};

const InteractionsTab = (props, context) => {
  const { act, data } = useBackend<ContentInfo>(context);
  const [
    searchText,
    setSearchText,
  ] = useLocalState(context, 'searchText', '');
  const interactions = sortInteractions(data.interactions, searchText) || [];
  return (
    <Table>
      <Table.Row>
        <Stack align="baseline">
          <Stack.Item>
            <Icon name="search" />
          </Stack.Item>
          <Stack.Item grow>
            <Input
              fluid
              placeholder="Search for an interaction"
              onInput={(e, value) => setSearchText(value)} />
          </Stack.Item>
        </Stack>
        <br />
      </Table.Row>
      {
        interactions.length ? (
          interactions.map((interaction) => (
            <Table.Row key={interaction.key}>
              <Button
                key={interaction.key}
                content={interaction.desc}
                color={interaction.type === 2 ? "red" : interaction.type ? "pink" : "default"}
                fluid
                mb={0.3}
                onClick={() => act('interact', {
                  interaction: interaction.key,
                })} />
            </Table.Row>
          ))
        ) : (
          <Section align="center">
            {
              searchText ? (
                "No matching results."
              ) : (
                "No interactions available."
              )
            }
          </Section>
        )
      }
    </Table>
  );
};

/**
 * Interaction sorter! also search box
 */
export const sortInteractions = (interactions, searchText = '') => {
  const testSearch = createSearch<InteractionData>(searchText,
    interaction => interaction.desc);
  return flow([
    // Optional search term
    searchText && filter(testSearch),
    // Slightly expensive, but way better than sorting in BYOND
    sortBy(interaction => interaction.desc),
    sortBy(interaction => interaction.type),
  ])(interactions);
};

// Self explanatory
const ModeToIcon = {
  "Always visible": "eye",
  "Hidden by clothes": "tshirt",
  "Hidden by underwear": "low-vision",
  "Always hidden": "eye-slash",
  "Allows egg stuffing": "egg",
};

/*
  Greetings you, yes you, adding more stuff to actions,
  To not have as much headache as i did,
  do not attempt to make a sum of 100% with the buttons
  as it will mess up math somewhere and overflow.

  Also this is adjusted only for the current size,
  if anyone feels like shrinking,
  their window it will overflow anyways.
  Single items is fine.
*/
const GenitalTab = (props, context) => {
  const { act, data } = useBackend<GenitalInfo>(context);
  const genitals = data.genitals || [];
  return (
    genitals.length ? (
      <Flex direction="column">
        {genitals.map(genital => (
          <Section key={genital.key} title={genital.name} textAlign="center">
            <Table>
              <TableCell width="50%" textAlign="center">
                Visibility<br />
                {genital.possible_choices.map(choice => (
                  <Button
                    width={((1 / genital.possible_choices.length) * 97) + "%"}
                    key={choice}
                    tooltip={choice}
                    icon={ModeToIcon[choice]}
                    color={genital.visibility === choice ? "green" : "default"}
                    onClick={() => act('genital', {
                      genital: genital.key,
                      visibility: choice,
                    })} />
                ))}
              </TableCell>
              <TableCell textAlign="center">
                Actions<br />
                <Button
                  width="50%"
                  key={genital.arousal_state}
                  tooltip={genital.can_arouse
                    ? ((genital.arousal_state ? "Unarouse" : "Arouse") + " your " + genital.name.toLowerCase())
                    : "You cannot modify arousal on your " + genital.name.toLowerCase()}
                  icon="heart"
                  color={genital.can_arouse ? (genital.arousal_state ? "green" : "default") : "grey"}
                  onClick={() => act('genital', {
                    genital: genital.key,
                    set_arousal: !genital.arousal_state,
                  })} />
                  {genital.extra_choices instanceof Array
                    ? genital.extra_choices.map(choice => (
                      <Button
                        width="50%"
                        key={choice}
                        tooltip={choice}
                        icon={ModeToIcon[choice]}
                        color={genital.extras === choice ? "green" : "default"}
                        onClick={() => act('genital', {
                          genital: genital.key,
                          visibility: choice,
                        })} />
                    )) : null}
              </TableCell>
            </Table>
          </Section>
        ))}
      </Flex>
    ) : (
      <Section align="center">
        You don&apos;t seem to have any genitals...
        Or any that you could modify.
      </Section>
    )
  );
};

const GenitalManagerTab = (props, context) => {
  const { act, data } = useBackend<GenitalManagerInfo>(context);
  const isTargetSelf = data.isTargetSelf;
  const genital_fluids = data.genital_fluids || [];
  const genital_interactibles = data.genital_interactibles || [];
  return (
    genital_fluids.length || genital_interactibles.length ? (
      <>
        <Section title="Genital Fluids">
          <LabeledList>
            {genital_fluids.map(genital => (
              <LabeledList.Item key={genital['key']} label={genital['name']}>
                <ProgressBar
                  key={genital['key']}
                  value={genital['fluid'] ? genital['fluid'] : 0.0}
                  color="white" />
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>
        <Section title="Actions">
          {genital_interactibles.map(genital => (
            <Section key={genital.key} title={genital.name}>
              {
                genital.equipments.length ? (
                  <>
                    <b>Equipments:</b>
                    <Table direction="column">
                      {genital.equipments.map(equipment => (
                        <TableRow key={equipment}>
                          {equipment}
                        </TableRow>
                      ))}
                    </Table>
                    <Divider />
                  </>
                ) : null
              }

              {genital.possible_choices.map(choice => (
                <Button
                  key={choice}
                  content={choice}
                  tooltip={choice}
                  onClick={() => act('genital_interaction', {
                    genital: genital.key,
                    action: choice,
                  })} />
              ))}
            </Section>
          ))}
        </Section>
      </>
    ) : (
      <Section align="center">
        {
          isTargetSelf
            ? "You don't seem to have any genitals... Or any that you could do anything with"
            : "They don't seem to have any genitals... Or any that you could do anything with"
        }
      </Section>
    )
  );
};

const CharacterPrefsTab = (props, context) => {
  const { act, data } = useBackend<CharacterPrefsInfo>(context);
  const {
    erp_pref,
    noncon_pref,
    vore_pref,
    unholy_pref,
    extreme_pref,
    extreme_harm,
  } = data;
  return (
    <Stack direction="column">
      <LabeledList>
        <LabeledList.Item label="ERP Preference">
          <Button
            icon={"check"}
            color={erp_pref === 1 ? "green" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'erp_pref',
              value: 1,
            })} />
          <Button
            icon={"question"}
            color={erp_pref === 2 ? "yellow" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'erp_pref',
              value: 2,
            })} />
          <Button
            icon={"times"}
            color={erp_pref === 0 ? "red" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'erp_pref',
              value: 0,
            })} />
        </LabeledList.Item>
        <LabeledList.Item label="Noncon Preference">
          <Button
            icon={"check"}
            color={noncon_pref === 1 ? "green" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'noncon_pref',
              value: 1,
            })} />
          <Button
            icon={"question"}
            color={noncon_pref === 2 ? "yellow" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'noncon_pref',
              value: 2,
            })} />
          <Button
            icon={"times"}
            color={noncon_pref === 0 ? "red" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'noncon_pref',
              value: 0,
            })} />
        </LabeledList.Item>
        <LabeledList.Item label="Vore Preference">
          <Button
            icon={"check"}
            color={vore_pref === 1 ? "green" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'vore_pref',
              value: 1,
            })} />
          <Button
            icon={"question"}
            color={vore_pref === 2 ? "yellow" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'vore_pref',
              value: 2,
            })} />
          <Button
            icon={"times"}
            color={vore_pref === 0 ? "red" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'vore_pref',
              value: 0,
            })} />
        </LabeledList.Item>
        <LabeledList.Item label="Unholy Preference">
          <Button
            icon={"check"}
            color={unholy_pref === 1 ? "green" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'unholy_pref',
              value: 1,
            })} />
          <Button
            icon={"question"}
            color={unholy_pref === 2 ? "yellow" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'unholy_pref',
              value: 2,
            })} />
          <Button
            icon={"times"}
            color={unholy_pref === 0 ? "red" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'unholy_pref',
              value: 0,
            })} />
        </LabeledList.Item>
        <LabeledList.Item label="Extreme Preference">
          <Button
            icon={"check"}
            color={extreme_pref === 1 ? "green" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'extreme_pref',
              value: 1,
            })} />
          <Button
            icon={"question"}
            color={extreme_pref === 2 ? "yellow" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'extreme_pref',
              value: 2,
            })} />
          <Button
            icon={"times"}
            color={extreme_pref === 0 ? "red" : "default"}
            onClick={() => act('char_pref', {
              char_pref: 'extreme_pref',
              value: 0,
            })} />
        </LabeledList.Item>
        {extreme_pref ? (
          <LabeledList.Item label="Extreme Harm">
            <Button
              icon={"check"}
              color={extreme_harm ? "green" : "default"}
              onClick={() => act('char_pref', {
                char_pref: 'extreme_harm',
                value: 1,
              })} />
            <Button
              icon={"times"}
              color={extreme_harm ? "default" : "red"}
              onClick={() => act('char_pref', {
                char_pref: 'extreme_harm',
                value: 0,
              })} />
          </LabeledList.Item>
        ) : (null)}
      </LabeledList>
    </Stack>
  );
};

const ContentPreferencesTab = (props, context) => {
  const { act, data } = useBackend<ContentPrefsInfo>(context);
  const {
    verb_consent,
    lewd_verb_sounds,
    arousable,
    genital_examine,
    vore_examine,
    medihound_sleeper,
    eating_noises,
    digestion_noises,
    trash_forcefeed,
    forced_fem,
    forced_masc,
    hypno,
    bimbofication,
    breast_enlargement,
    penis_enlargement,
    butt_enlargement,
    belly_inflation,
    never_hypno,
    no_aphro,
    no_ass_slap,
    no_auto_wag,
  } = data;
  return (
    <Table>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Allow lewd verbs"
          icon={verb_consent ? "toggle-on" : "toggle-off"}
          selected={verb_consent}
          onClick={() => act('pref', {
            pref: 'verb_consent',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Lewd verb sounds"
          icon={lewd_verb_sounds ? "volume-up" : "volume-mute"}
          selected={lewd_verb_sounds}
          onClick={() => act('pref', {
            pref: 'lewd_verb_sounds',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Arousal"
          icon={arousable ? "toggle-on" : "toggle-off"}
          selected={arousable}
          onClick={() => act('pref', {
            pref: 'arousable',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Genital examine text"
          icon={genital_examine ? "toggle-on" : "toggle-off"}
          selected={genital_examine}
          onClick={() => act('pref', {
            pref: 'genital_examine',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Vore examine text"
          icon={vore_examine ? "toggle-on" : "toggle-off"}
          selected={vore_examine}
          onClick={() => act('pref', {
            pref: 'vore_examine',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Voracious Medihound sleepers"
          icon={medihound_sleeper ? "toggle-on" : "toggle-off"}
          selected={medihound_sleeper}
          onClick={() => act('pref', {
            pref: 'medihound_sleeper',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Hear vore sounds"
          icon={eating_noises ? "volume-up" : "volume-mute"}
          selected={eating_noises}
          onClick={() => act('pref', {
            pref: 'eating_noises',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Hear vore digestion sounds"
          icon={digestion_noises ? "volume-up" : "volume-mute"}
          selected={digestion_noises}
          onClick={() => act('pref', {
            pref: 'digestion_noises',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Allow trash forcefeeding (requires Trashcan quirk)"
          icon={trash_forcefeed ? "toggle-on" : "toggle-off"}
          selected={trash_forcefeed}
          onClick={() => act('pref', {
            pref: 'trash_forcefeed',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Forced feminization"
          icon={forced_fem ? "toggle-on" : "toggle-off"}
          selected={forced_fem}
          onClick={() => act('pref', {
            pref: 'forced_fem',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Forced Masculinization"
          icon={forced_masc ? "toggle-on" : "toggle-off"}
          selected={forced_masc}
          onClick={() => act('pref', {
            pref: 'forced_masc',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Lewd hypno"
          icon={hypno ? "toggle-on" : "toggle-off"}
          selected={hypno}
          onClick={() => act('pref', {
            pref: 'hypno',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Bimbofication"
          icon={bimbofication ? "toggle-on" : "toggle-off"}
          selected={bimbofication}
          onClick={() => act('pref', {
            pref: 'bimbofication',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Breast enlargement"
          icon={breast_enlargement ? "toggle-on" : "toggle-off"}
          selected={breast_enlargement}
          onClick={() => act('pref', {
            pref: 'breast_enlargement',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Penis enlargement"
          icon={penis_enlargement ? "toggle-on" : "toggle-off"}
          selected={penis_enlargement}
          onClick={() => act('pref', {
            pref: 'penis_enlargement',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Butt enlargement"
          icon={butt_enlargement ? "toggle-on" : "toggle-off"}
          selected={butt_enlargement}
          onClick={() => act('pref', {
            pref: 'butt_enlargement',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Belly inflation"
          icon={belly_inflation ? "toggle-on" : "toggle-off"}
          selected={belly_inflation}
          onClick={() => act('pref', {
            pref: 'belly_inflation',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Hypno"
          icon={never_hypno ? "toggle-on" : "toggle-off"}
          selected={never_hypno}
          onClick={() => act('pref', {
            pref: 'never_hypno',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Aphrodisiacs"
          icon={no_aphro ? "toggle-on" : "toggle-off"}
          selected={no_aphro}
          onClick={() => act('pref', {
            pref: 'no_aphro',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Ass slapping"
          icon={no_ass_slap ? "toggle-on" : "toggle-off"}
          selected={no_ass_slap}
          onClick={() => act('pref', {
            pref: 'no_ass_slap',
          })}
        />
      </Table.Row>
      <Table.Row>
        <Button
          fluid
          mb={0.3}
          content="Automatic wagging"
          icon={no_auto_wag ? "toggle-on" : "toggle-off"}
          selected={no_auto_wag}
          onClick={() => act('pref', {
            pref: 'no_auto_wag',
          })}
        />
      </Table.Row>
    </Table>
  );
};
