<script>
  import { getMediaUrl } from "$lib/api";
  import Image from "$lib/Image.svelte";
  import { onMount } from "svelte";
  import { fade } from 'svelte/transition';
  import { goto } from '$app/navigation';
  import Title from "./Title.svelte";

  export let images;
  export let video;
  export let page;
  export let title;

  let motion = false;
  let imageIndex = 0;

  function next() {
    imageIndex = (imageIndex+1) % images.length;
  }

  onMount(() => {
    setInterval(next, 5000);
  });
</script>

<section class="m-4" on:mouseenter={() => motion = true } on:mouseleave={() => motion = false }>
  {#if title}
    <Title content={title}></Title>
  {/if}
  <Image src={getMediaUrl(images[imageIndex])} ratio="16/9" class="cursor-pointer" on:click={() => goto(`/page/${page.id}-${page.slug}`)} >
    {#if motion}
      <video class="absolute inset-0 w-full h-full" autoplay src={getMediaUrl(video)} transition:fade|local />
    {/if}
  </Image>
</section>