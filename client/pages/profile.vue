<template>
<!-- component -->
<div class="flex items-center h-screen w-full justify-center">

<div class="max-w-xs">
    <div class="bg-white shadow-xl rounded-lg py-3">
        <div class="photo-wrapper p-2">
            <img src="https://avatars.dicebear.com/api/human/archibald00@example.com.svg" alt="avatar" class="w-10 h-10 bg-gray-300 rounded-full flex-shrink-0">
        </div>
        <div class="p-2">
            <h3 class="text-center text-xl text-gray-900 font-medium leading-8">Joseph Showunmi</h3>
            <div class="text-center text-gray-400 text-xs font-semibold">
                <p>DevOps</p>
            </div>
            <table class="text-xs my-3">
                <tbody><tr>
                    <td class="px-2 py-2 text-gray-500 font-semibold">Address</td>
                    <td class="px-2 py-2">Columbia, MD</td>
                </tr>
                <tr>
                    <td class="px-2 py-2 text-gray-500 font-semibold">Phone</td>
                    <td class="px-2 py-2">00 11 22 33 44</td>
                </tr>
                <tr>
                    <td class="px-2 py-2 text-gray-500 font-semibold">Email</td>
                    <td class="px-2 py-2">joseph.dev@gmail.com</td>
                </tr>
            </tbody></table>

        </div>
    </div>
</div>

</div>
</template>

<script lang="ts">
import Vue from 'vue'
import { Users } from '@/types/api'
export default Vue.extend({
  data () {
    const users:Users = []
    const count:number = 9
    console.log(users)

    return {
      users,
      count,
      user:users[0],
    }
  },
  mounted () {
    this.get(this.count)
    console.log('test')
  },
  methods: {
    async get (count: number): Promise<void> {
      await this.$sleep(2000)
      this.users = (
        await this.$axios.get('example', { params: { count } })
      ).data.data as Users
    },
    total (count: number): void {
      this.users = []
      this.count = count
      this.get(this.count)
    },
  },
})
</script>
