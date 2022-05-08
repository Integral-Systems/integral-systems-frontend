<script>
import { onMount } from 'svelte';

  import { fade } from 'svelte/transition';

  export let src;
  export let ratio = "1";
  let className =""; 
  export { className as class };

  let loaded = '';
  
  let mounted = false;
  onMount(() => mounted = true);

  $: if(mounted) preload(src);

  function preload(src) {
    const img = new Image();
    img.onload = () => loaded = img.src;
    img.src = src;
  }
</script>

<div class="relative {className}" style="aspect-ratio:{ratio};" on:click>
  <slot></slot>
  {#key loaded}
    <div
      in:fade|local={{ delay: 0, duration: 1000 }} 
      out:fade|local={{ delay: 1000, duration: 1000 }}
      style="background-image:url('{loaded}');z-index:-1;" 
      class="bg-cover bg-center absolute inset-0"
    />
  {/key}
</div>