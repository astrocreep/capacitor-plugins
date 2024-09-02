import { registerPlugin } from '@capacitor/core'

import type { TextInteractionPlugin } from './definitions'

const TextInteraction = registerPlugin<TextInteractionPlugin>(
  'TextInteraction',
  {},
)

export * from './definitions'
export { TextInteraction }
