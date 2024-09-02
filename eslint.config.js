import antfu from '@antfu/eslint-config'

const config = antfu({
  rules: {
    'eqeqeq': ['error', 'smart'],
    'no-cond-assign': ['error', 'except-parens'],
    'no-console': 'off',
    'no-labels': 'off',
    'no-restricted-syntax': 'off',
    'no-unused-labels': 'off',
    'node/prefer-global/process': 'off',
    'ts/no-explicit-any': 'error',
    'ts/method-signature-style': 'off'
  },
  typescript: true,
  javascript: true,
  jsonc: false,
  vue: false,
  yaml: false,
}, {}, {
  ignores: [
    '.husky',
    '**/.vscode/',
    '**/bin/',
    '**/node_modules/',
    '**/*.d.ts',
    '**/www/',
    '**/*.json',
  ],
})

export default config
