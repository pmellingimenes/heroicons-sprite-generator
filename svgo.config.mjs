export default {
  plugins: [
    {
      name: "preset-default",
      params: {
        overrides: {
          // disable default plugins
          removeHiddenElems: false,
          cleanupIds: false,
        },
      },
    },
  ],
};
