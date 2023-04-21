<script setup lang="ts">
import { ref } from 'vue'

defineProps<{ msg: string }>()

const count = ref(0)
async function getApiHello() {
  const res = await fetch('/api/')
  console.log('hello', res)
}
async function getApiJson() {
  const res = await fetch('/api/json')
  console.log('json', res)
}
</script>

<template>
  <h1>{{ msg }}</h1>

  <div class="card">
    <div class="space">
      <button type="button" @click="count++">
        count is {{ count }}
      </button>
      <button type="button" @click="getApiHello">
        Get HelloWorld
      </button>
      <button type="button" @click="getApiJson">
        Get Json
      </button>
    </div>
    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank">create-vue</a>, the official Vue + Vite starter
  </p>
  <p>
    Install
    <a href="https://github.com/vuejs/language-tools" target="_blank">Volar</a>
    in your IDE for a better DX
  </p>
  <p class="read-the-docs">
    Click on the Vite and Vue logos to learn more
  </p>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
.space{
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
}
</style>
