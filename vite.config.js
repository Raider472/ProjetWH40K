import { defineConfig } from 'vite'

export default defineConfig({
  build:{
    rollupOptions:{
        input: {
            app:"src/index.php"
        }
    }
  },
  server: {
    port: "8060",
    open:"http://localhost:8060"
  }
})