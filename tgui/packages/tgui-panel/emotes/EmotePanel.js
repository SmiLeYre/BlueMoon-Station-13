import { Button, Flex, Section } from 'tgui/components';
import { sendMessage } from 'tgui/backend';
import { useEmotes } from './hooks';

export const EmotePanel = (props, context) => {
  const emotes = useEmotes(context);

  const emoteList = [];
  for (const key in emotes.list) {
    emoteList.push({ key, name: emotes.list[key] });
  }

  const emoteCreate = () => sendMessage({
    type: 'emotes/create',
  });

  const emoteExecute = key => sendMessage({
    type: 'emotes/execute',
    payload: { key },
  });

  const emoteContextAction = key => sendMessage({
    type: 'emotes/contextAction',
    payload: { key },
  });

  return (
    <Section>
      <Flex align="center" style={{ 'flex-wrap': 'wrap' }}>
        {emoteList
          .sort((a, b) => { return a.name.localeCompare(b.name); })
          .map(emote => (
            <Flex.Item mx={0.5} mt={1} key={emote.key}>
              <Button
                content={emote.name}
                onClick={() => emoteExecute(emote.key)}
                onContextMenu={(e) => {
                  e.preventDefault();
                  emoteContextAction(emote.key);
                }}
                tooltip={`*${emote.key}`}
              />
            </Flex.Item>
          ))}
        <Flex.Item mx={0.5} mt={1}>
          <Button
            icon="plus"
            color="green"
            onClick={() => emoteCreate()}
          />
        </Flex.Item>
      </Flex>
    </Section>
  );
};
