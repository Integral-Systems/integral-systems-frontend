<script>
  import Image from '$lib/Image.svelte';
  
  export let image;
  export let caption;

  let className = '';
  export { className as class};
</script>

<Image src={image} class="h-full rounded-lg {className}" on:click>
  <caption class="absolute flex flex-row items-center justify-center text-4xl p-1 bottom-0 inset-x-0" style="background-color: #0000007F">{caption}</caption>
</Image>