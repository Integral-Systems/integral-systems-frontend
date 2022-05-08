<script>
	import '../app.scss';
	import '../styles/tailwind-output.css';
	import Navigation from '$lib/components/Navigation.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import Toast from '$lib/components/Toast.svelte';
    import Cookie from '$lib/components/Cookie.svelte';
    import Chat from '$lib/components/Chat.svelte';
</script>

<svelte:head>
	<title>Integral Systems</title>
    <meta name="description" content="Find a new addition to your team who is not only competent, but who fits your culture." />
    <meta name="keywords" content="recruitment, people centric, diversity, " />
    <meta
        name="robots"
        content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1"
    />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <html lang="en" />
    <!--
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Grow your Business Digitally | In Hyderabad" />
    <meta property="og:description" content="Neoistone is a reliable, fast and robust platform for all the needs of Hosting and Domain name development tools is so easy to use that litespeed it makes fast site" />
    <meta property="og:url" content="http://localhost/" />
    <meta property="og:site_name" content="Neoistone: Best Web Development and Hosting services" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Grow your Business Digitally | In Hyderabad" />
    <meta name="twitter:description" content="Neoistone is a reliable, fast and robust platform for all the needs of Hosting and Domain name development tools is so easy to use that litespeed it makes fast site" />
    <meta name="twitter:image" content="http://localhost/static/brand/banner_logo.png" />
-->
</svelte:head>

<Toast />
<Navigation />
<slot />

<Footer />
<Cookie />
<Chat />
<!-- Try some classes here -->
