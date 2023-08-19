import { Section, Flex, Divider, Table, Collapsible, Box } from "../components";
import { Window } from "../layouts";
import { useBackend, useLocalState } from "../backend";
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
  headshot_link: string;
  //fullref_url: string;
  //fullref_toggle: boolean;
  flavortext_general: string;
  flavortext_naked: string;
  silicon_flavor_text: string;
  oocnotes: string;
  species_name: string;
  species_text: string;
  vore_tag: string;
  erp_tag: string;
  mob_tag: string;
  nc_tag: string;
  unholy_tag: string;
  very_unholy_tag: string;
}

export const CharacterProfile = (props, context) => {
  const { act, data } = useBackend<CharacterProfileContext>(context);
  const [selectedTab, setSelectedTab] = useLocalState<number>(
    context,
    "selectedTab",
    1
  );
  let combinedspeciesname : string = "";
  combinedspeciesname = combinedspeciesname.concat("Раса - ", data.species_name);

  return (
    <Window resizable width={950} height={800}>
      <Window.Content scrollable>
        <Tabs>
          <Tabs.Tab onClick={() => setSelectedTab(1)}>
            Визуальный Осмотр / Описание
          </Tabs.Tab>
          <Tabs.Tab onClick={() => act("character_directory")}>
            Библиотека Персонажей
          </Tabs.Tab>
        </Tabs>
        {selectedTab === 1 && (
          <Flex>
            <Flex.Item pl="10px">
              <CharacterProfileImageElement />
            </Flex.Item>
            <Flex.Item Flex-direction="column" pl="10px" width="100%">
              <Collapsible title={combinedspeciesname} open>
                <Section style={{ "white-space": "pre-line" }}>
                  {data.species_text}
                </Section>
              </Collapsible>
              <Collapsible title="Описание Персонажа" open>
                <Section>
                  <CharacterProfileDescElement />
                </Section>
              </Collapsible>
              <Collapsible title="Внеигровые Заметки" open>
                <Section style={{ "white-space": "pre-line" }}>
                  {data.oocnotes}
                </Section>
              </Collapsible>
              {data.directory_visible ? (
                <Section title="Преференсы Персонажа" width="100%">
                  <Table>
                    <Table.Row backgroundColor={getTagColor(data.erp_tag)}>
                      <Table.Cell>Эротическое Раскрытие Персонажа</Table.Cell>
                      <Table.Cell>{data.erp_tag}</Table.Cell>
                    </Table.Row>
                    <Table.Row backgroundColor={getTagColor(data.nc_tag)}>
                      <Table.Cell>Изнасилование</Table.Cell>
                      <Table.Cell>{data.nc_tag}</Table.Cell>
                    </Table.Row>
                    <Table.Row backgroundColor={getTagColor(data.unholy_tag)}>
                      <Table.Cell>Жестокий Секс</Table.Cell>
                      <Table.Cell>{data.unholy_tag}</Table.Cell>
                    </Table.Row>
                    <Table.Row backgroundColor={getTagColor(data.very_unholy_tag)}>
                      <Table.Cell>Грязный Секс</Table.Cell>
                      <Table.Cell>{data.very_unholy_tag}</Table.Cell>
                    </Table.Row>
                    <Table.Row backgroundColor={getTagColor(data.vore_tag)}>
                      <Table.Cell>Поедание/Проглатывание</Table.Cell>
                      <Table.Cell>{data.vore_tag}</Table.Cell>
                    </Table.Row>
                    <Table.Row backgroundColor={getTagColor(data.mob_tag)}>
                      <Table.Cell>Совокупление с Мобами</Table.Cell>
                      <Table.Cell>{data.mob_tag}</Table.Cell>
                    </Table.Row>
                  </Table>
                </Section>
              ) : (
                <Divider vertical />
              )}
            </Flex.Item>
          </Flex>
        )}
      </Window.Content>
    </Window>
  );
};

const CharacterProfileImageElement = (props, context) => {
  const { act, data } = useBackend<CharacterProfileContext>(context);
  if (data.headshot_link) return (<Section title="Арт Персонажа" pb="12" textAlign="center"><img src={data.headshot_link} height="256px" width="256px" /></Section>);
  return (<Box />);
};


const CharacterProfileDescElement = (props, context) => {
  const { act, data } = useBackend<CharacterProfileContext>(context);

  return (
    <Flex direction="column">
      {data.flavortext_general !== "" ? (<Flex.Item style={{ "white-space": "pre-line" }}><Divider /><b>Основное Описание</b><br />{data.flavortext_general}</Flex.Item>): (<Box />) }
      {data.silicon_flavor_text !== "" ? (<Flex.Item style={{ "white-space": "pre-line" }}><Divider /><b>Описание Силикона</b><br />{data.silicon_flavor_text}</Flex.Item>): (<Box />) }
    </Flex>
  ); };
