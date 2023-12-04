import { Section, Flex, Divider, Collapsible, Box, Tooltip, LabeledList, ByondUi, Button } from "../components";
import { Window } from "../layouts";
import { useBackend } from "../backend";
import { Tabs } from "../components";

const getTagColor = (erptag) => {
  switch (erptag) {
    case "Yes":
      return "green";
    case "Ask":
      return "blue";
    case "No":
      return "red";
  }
};

// I am aware that the following context with
// all these vars is messy, but this isn't particularly
// 'hot' code given it's static data.

interface CharacterProfileContext {
  directory_visible: boolean;
  is_unknown: boolean;
  headshot_link: string;
  character_ref: any,
  flavortext: string;
  flavortext_naked: string;
  silicon_flavor_text: string;
  oocnotes: string;
  species_name: string;
  custom_species_lore: string;
  vore_tag: string;
  erp_tag: string;
  mob_tag: string;
  hornyantags_tag: string;
  nc_tag: string;
  unholy_tag: string;
  extreme_tag: string;
  very_extreme_tag: string;
}

export const CharacterProfile = (props, context) => {
  const { act, data } = useBackend<CharacterProfileContext>(context);

  const tags = [
    { name: "ERP", title: "Эротический отыгрыш", value: data.erp_tag },
    { name: "Non-Con", title: "Изнасилование", value: data.nc_tag },
    { name: "Vore", title: "Поедание/Проглатывание", value: data.vore_tag },
    { name: "Mob-Sex", title: "Совокупление с Мобами", value: data.mob_tag },
    { name: "Horny Antags", title: "Жертва хорни антагов", value: data.hornyantags_tag },
    { name: "Unholy", title: "Грязный секс", value: data.unholy_tag },
    { name: "Extreme", title: "Жестокий секс", value: data.extreme_tag },
    { name: "Extreme Harm", title: "Очень жестокий секс", value: data.very_extreme_tag },
  ];

  return (
    <Window resizable width={950} height={730}>
      <Window.Content scrollable>
        <Flex>
          <Flex.Item pl="10px">
          {
            // убрал проверку на ношение маски для отображения хеда
            }
          { /*  {!data.is_unknown ? (<CharacterProfileImageElement />)
              : (<Box />)}*/}
            <CharacterProfileImageElement />
            <CharacterModelImageElement />
          </Flex.Item>
          <Flex.Item Flex-direction="column" pl="10px" width="100%">
            <Collapsible title="Описание Персонажа" open>
              <Section style={{ "white-space": "pre-line" }}>
                {data.flavortext || "———"}
              </Section>
            </Collapsible>
            <Collapsible title="Описание Голого Тела Персонажа" open>
              <Section style={{ "white-space": "pre-line" }}>
                {data.flavortext_naked || "———"}
              </Section>
            </Collapsible>
            <Collapsible title={`Раса - ${data.species_name}`} open>
              <Section style={{ "white-space": "pre-line" }}>
                {data.custom_species_lore || "———"}
              </Section>
            </Collapsible>
            <Collapsible title="Внеигровые заметки" open>
              <Section style={{ "white-space": "pre-line" }}>
                {data.oocnotes || "———"}
              </Section>
            </Collapsible>
            <Section title="Предпочтения персонажа" width="100%">
              <LabeledList>
                {tags.map(tag => (
                  <LabeledList.Item
                    key={tag.name}
                    color={getTagColor(tag.value)}
                    label={tag.title}>
                    <Tooltip content={tag.name}>{tag.value}</Tooltip>
                  </LabeledList.Item>
                ))}
              </LabeledList>
            </Section>
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};

const CharacterProfileImageElement = (props, context) => {
  const { data } = useBackend<CharacterProfileContext>(context);
  if (data.headshot_link) return (<Section title="Арт персонажа" pb="12" textAlign="center"><img src={data.headshot_link} height="256px" width="256px" /></Section>);
  return (<Box />);
};

const CharacterModelImageElement = (props, context) => {
  const { act, data } = useBackend<CharacterProfileContext>(context);

  return (
    <Section title="Модель персонажа" pb="12" textAlign="center">
      <ByondUi
        height="256px" width="256px"
        params={{ id: data.character_ref, type: 'map' }}
      />
      <Box>
        <Button onClick={()=>act("char_left")} icon="undo" />
        <Button onClick={()=>act("change_background")}>Сменить фон</Button>
        <Button onClick={()=>act("char_right")} icon="redo" />
        <Button onClick={()=>act("character_directory")}>
            Библиотека Персонажей
        </Button>
      </Box>
    </Section>
  );
};
