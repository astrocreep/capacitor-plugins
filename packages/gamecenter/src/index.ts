import { registerPlugin } from '@capacitor/core';

import type { GameCenterPlugin } from './definitions';

const GameCenter = registerPlugin<GameCenterPlugin>('GameCenter', {
});

export * from './definitions';
export { GameCenter };
