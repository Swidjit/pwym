<div class="post" id="post-<?php the_ID(); ?>">
	<h2><?php the_title(); ?></h2>
	<p class="postmetadata"><small><?php the_time('F jS, Y') ?> <?php the_author() ?> </small> Posted in <?php the_category(', ') ?> | <?php edit_post_link('Edit', '', ' | '); ?>  <?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;'); ?> <?php if(function_exists('the_views')) { the_views(); } ?></p>


	<div>
			<?php $cat = get_the_category(); $cat_slug = $cat[0] -> slug; ?>
			<?php $swf_name = the_title('','',false); $swf_name = str_replace(' ','_',$swf_name); ?>
			<script src="http://playwithyourmind.com/swfobject.js" type="text/javascript"></script>
			<div align="center">
				<div id="game">
					<div align="center" style="margin-top:100px; width:320px; height:240px;"><a href="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_new"></a><p>In order to view the content on this page, you will need the latest version of Adobe’s Flash Player. <a href="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_new">Click here to download it</a>.</p></div>
				</div>
			</div>
			
			<script type="text/javascript">
			// <![CDATA[
			
			var so = new SWFObject("http://playwithyourmind.com/puzzles-brainteasers/<?php echo($cat_slug); ?>/<?php echo($swf_name); ?>.swf", "sotester", "550", "300", "9", "#FFFFFF");
			so.addParam("wmode", "transparent");
			so.addVariable("username", "<?php echo($userdata->user_login); ?>");

			so.write("game");	
			document.write(title);
			
			// ]]>
			</script>
			
			<div class="br"><br /></div>
			<div class="aligncenter" align="center">
			<?php previous_post_link('%link', '< Previous puzzle', TRUE); ?>
			<? echo(' | '); ?>
			<?php next_post_link('%link', 'Next puzzle >', TRUE); ?>
			</div>
		<?php if ( function_exists('the_tags') ) { the_tags('<p>Tags: ', ', ', '</p>'); } ?>
		<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
		<br />

		<p>
			<small>
				<span>
				You can follow any responses to this entry through the</span> <?php comments_rss_link('RSS 2.0'); ?> <span>feed.</span>

				<?php if (('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
					// Both Comments and Pings are open ?>
					<span>You can </span><a href="#respond">leave a response</a>, <span>or</span> <a href="<?php trackback_url(true); ?>" rel="trackback">trackback</a> <span>from your own site.</span>

				<?php } elseif (!('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
					// Only Pings are Open ?>
					Responses are currently closed, but you can <a href="<?php trackback_url(true); ?> " rel="trackback">trackback</a> from your own site.

				<?php } elseif (('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
					// Comments are open, Pings are not ?>
					You can skip to the end and leave a response. Pinging is currently not allowed.

				<?php } elseif (!('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
					// Neither Comments, nor Pings are open ?>
					Both comments and pings are currently closed.

				<?php } edit_post_link('Edit this entry.','',''); ?>

			</span></small>
		</p>

	</div>

	<!-- AddThis Bookmark Post Button BEGIN -->
	<?php echo "<div class=\"addthis\"><a href=\"http://www.addthis.com/bookmark.php?pub=blogohblog&amp;url=".get_permalink()."&amp;title=".get_the_title($id)."\" title=\"Bookmark using any bookmark manager!\" target=\"_blank\"><img src=\"http://s9.addthis.com/button1-bm.gif\" width=\"125\" height=\"16\" border=\"0\" alt=\"AddThis Social Bookmark Button\" /></a></div>"; ?>
	<!-- AddThis Bookmark Post Button END -->

</div>