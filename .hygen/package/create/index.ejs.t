---
to: packages/<%= name %>/src/index.ts
---

export * from "./<%= h.changeCase.pascal(name) %>";
