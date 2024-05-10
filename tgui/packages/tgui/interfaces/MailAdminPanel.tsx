import { sortBy } from 'common/collections';
import { useBackend } from '../backend';
import { Box, Button, Dropdown, Flex, NumberInput, ProgressBar, Section } from '../components';
import { Window } from '../layouts';

export const Photocopier = (props, context) => {
  const { data } = useBackend(context);
  const {
    isAI,
    has_toner,
    has_item,
    categories = [],
    paper_count,
    copies_left,
  } = data;

  return (
    <Window title="Универсальный Сканнер/Принтер" width={320} height={512}>
      <Window.Content>
        {has_toner ? (
          <Toner />
        ) : (
          <Section title="Картридж">
            <Box color="average">Внутри нет Струйного Картриджа.</Box>
          </Section>
        )}
        <Section title="Бумага">
          <Box color="label">Количество Бумаги Внутри: {paper_count}</Box>
          {!!copies_left && (
            <Box color="label">Копий в Процессе: {copies_left}</Box>
          )}
        </Section>
        {categories.length !== 0 ? (
          <Blanks />
        ) : (
          <Section title="Готовые Формы">
            <Box color="average">
              No forms found. Please contact your system administrator.
            </Box>
          </Section>
        )}
        {has_item ? (
          <Options />
        ) : (
          <Section title="Дополнительные Опции">
            <Box color="average">Сканнер свободен.</Box>
          </Section>
        )}
        {!!isAI && <AIOptions />}
      </Window.Content>
    </Window>
  );
};

const Options = (props, context) => {
  const { act, data } = useBackend(context);
  const { color_mode, is_photo, num_copies } = data;

  return (
    <Section title="Дополнительные Опции">
      <Flex>
        <Flex.Item mt={0.4} width={11} color="label">
          Make copies:
        </Flex.Item>
        <Flex.Item>
          <NumberInput
            animate
            width={2.6}
            height={1.65}
            step={1}
            stepPixelSize={8}
            minValue={1}
            maxValue={10}
            value={num_copies}
            onDrag={(e, value) =>
              act('set_copies', {
                num_copies: value,
              })
            }
          />
        </Flex.Item>
        <Flex.Item>
          <Button
            ml={0.2}
            icon="copy"
            textAlign="center"
            onClick={() => act('make_copy')}>
            Copy
          </Button>
        </Flex.Item>
      </Flex>
      {!!is_photo && (
        <Flex mt={0.5}>
          <Flex.Item mr={0.4} width="50%">
            <Button
              fluid
              textAlign="center"
              selected={color_mode === 'Greyscale'}
              onClick={() =>
                act('color_mode', {
                  mode: 'Greyscale',
                })
              }>
              Greyscale
            </Button>
          </Flex.Item>
          <Flex.Item ml={0.4} width="50%">
            <Button
              fluid
              textAlign="center"
              selected={color_mode === 'Color'}
              onClick={() =>
                act('color_mode', {
                  mode: 'Color',
                })
              }>
              Color
            </Button>
          </Flex.Item>
        </Flex>
      )}
      <Button
        mt={0.5}
        textAlign="center"
        icon="reply"
        fluid
        onClick={() => act('remove')}>
        Remove item
      </Button>
    </Section>
  );
};

const Blanks = (props, context) => {
  const { act, data } = useBackend(context);
  const { blanks, categories, category } = data;

  const sortedBlanks = sortBy((blank) => blank.name)(blanks || []);

  const selectedCategory = category ?? categories[0];
  const visibleBlanks = sortedBlanks.filter(
    (blank) => blank.category === selectedCategory
  );

  return (
    <Section title="Готовые Формы">
      <Dropdown
        width="100%"
        options={categories}
        selected={selectedCategory}
        onSelected={(value) =>
          act('choose_category', {
            category: value,
          })
        }
      />
      <Box mt={0.4}>
        {visibleBlanks.map((blank) => (
          <Button
            key={blank.code}
            title={blank.name}
            onClick={() =>
              act('print_blank', {
                code: blank.code,
              })
            }>
            {blank.code}
          </Button>
        ))}
      </Box>
    </Section>
  );
};

const AIOptions = (props, context) => {
  const { act, data } = useBackend(context);
  const { can_AI_print } = data;

  return (
    <Section title="Возможности для ИИ">
      <Box>
        <Button
          fluid
          icon="images"
          textAlign="center"
          disabled={!can_AI_print}
          onClick={() => act('ai_photo')}>
          Print photo from database
        </Button>
      </Box>
    </Section>
  );
};
