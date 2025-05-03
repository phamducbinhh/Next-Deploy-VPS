module.exports = {
    apps: [
      {
        name: 'next-deploy-vps',
        script: 'npx',
        args: 'next start -p 3000',
        instances: 1,
        autorestart: true,
        watch: false,
        env: {
          NODE_ENV: 'production',
        },
      },
    ],
  };
