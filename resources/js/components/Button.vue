<template>
  <button :type="nativeType" :disabled="loading" :class="{
    [`btn-${type}`]: true,
    'btn-block': block,
    'btn-lg': large,
    'btn-loading': loading,
  }" class="btn font-weight-bold"
  >
    <slot />
  </button>
</template>

<style scoped>
 button {
   color: white;
   font-size: 12sp;
 }
</style>

<script>
export default {
  name: 'VButton',

  props: {
    type: {
      type: String,
      default: 'secondary'
    },

    nativeType: {
      type: String,
      default: 'submit'
    },

    loading: {
      type: Boolean,
      default: false
    },

    block: {
      type: Boolean,
      default: true
    },

    large: {
      type: Boolean,
      default: true
    }
  }
}
</script>
