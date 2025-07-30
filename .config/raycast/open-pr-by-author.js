#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Open PR by author
// @raycast.mode silent

// Optional parameters:
// @raycast.icon 🤖
// @raycast.argument1 { "type": "text", "placeholder": "repo" }
// @raycast.argument2 { "type": "text", "placeholder": "author" }

// documentation:
// @raycast.description open pull request by author 
// @raycast.author topcbl
// @raycast.authorurl https://raycast.com/topcbl

const { spawn } = require('child_process');

const repo = process.argv.slice(2)[0]
const author = process.argv.slice(2)[1]

const repoURL = {
  'sms': 'https://github.com/Personio-Internal/subscription-management-service', 
  'gw': 'https://github.com/Personio-Internal/growth-workflows',
  'cbs': 'https://github.com/Personio-Internal/chargebee-service',
  'monolith': 'https://gitlab.personio-internal.de/personio/personio',
  'personio-web': 'https://gitlab.personio-internal.de/personio/frontend/personio-web',
}

const gitlabAuthorShortcur = {
  'ali': 'ali.sabzevari',
  'juan': 'juan.lulkin',
  'long': 'long.chau.ext',
  'sarang': '8memonsarang8',
}

const githubUsers = {
  'ali': 'ali-sabzevari_personio',
  'juan': 'juan-lulkin_personio',
  'long': 'long-chaubao_personio',
  'sarang': 'sarang-memon_personio',
}

const guessRepo = Object.keys(repoURL).find((key) => {
  return key.includes(repo);
});


const repoInPath = repoURL[guessRepo || repo];
const authorUserName = gitlabAuthorShortcur[author] || author;
const githubAuthor = githubUsers[author];

spawn('open', [`${repoInPath}/pulls/${githubAuthor}`]);

