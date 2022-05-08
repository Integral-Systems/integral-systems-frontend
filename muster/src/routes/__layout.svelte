<script context="module">
  import { getConfiguration } from '$lib/api';

	export async function load({ fetch }) {
		const config = await getConfiguration(fetch);
		return { props: { configuration: config } };
	}
</script>

<script>
  import { fly } from 'svelte/transition';
  import { getMediaUrl } from "$lib/api";
  import Navigation from './components/Navigation.svelte';
  import DynamicZone from "$lib/DynamicZone.svelte";
  import "../app.css";

  export let configuration = {};
  let nav = false;
</script>

<svelte:head>
	<title>{configuration.name}</title>
</svelte:head>

<div class="fixedheight flex flex-col">

<header class="bg-black text-xl sticky top-0 z-10">
  <div class="maxwidth flex flex-row items-center gap-2 py-1 px-4">
    <img class="h-4 " src={getMediaUrl(configuration.icon)} alt="Logo" />
    <a href="/" class="hover:text-primary">{configuration.name}</a>
    <div class="flex-grow"></div>
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer hover:text-primary" on:click={() => nav = !nav} viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
    </svg>
  </div>
</header>

<main class="flex-auto">
  <div class="maxwidth">
    <slot></slot>
  </div>
</main>

<footer class="flex-shrink bg-black">
  <div class="maxwidth px-4 py-2 flex justify-center">
    {configuration.footer}
</div>
</footer>

</div>

{#if nav}
<nav
  transition:fly|local={{ x: 200, opacity: 0 }}
  class="fixed right-0 inset-y-0 bg-black text-white flex flex-col"
  on:click={() => nav = false}
>
  <DynamicZone components={configuration.navigation} />
</nav>
{/if}

<style>
  nav {
    width: max(20vw, 20rem);
    margin-top: 2rem;
  }

  .fixedheight {
    min-height: 100vh;
  }

  .maxwidth {
    max-width: 50rem;
    margin-left: auto;
    margin-right: auto;
  }

</style>
