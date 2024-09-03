import { registerPlugin } from '@capacitor/core';

import type { GameAnalyticsPlugin } from './definitions';

const GameAnalytics = registerPlugin<GameAnalyticsPlugin>('GameAnalytics');

export * from './definitions';
export { GameAnalytics };
