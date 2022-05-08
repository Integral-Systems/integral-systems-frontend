<script context="module">
	import { getConfiguration } from '$lib/api';

	export async function load({ fetch }) {
		const config = await getConfiguration(fetch);
		return { props: { page: config.index } };
	}
</script>

<script>
	import DynamicZone from '$lib/DynamicZone.svelte';
	export let page = null;
</script>

<DynamicZone components={page.content}></DynamicZone>



