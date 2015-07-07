<?php
class ControllerModuleLatestPost extends Controller {
	protected function index($setting) {
		$this->language->load('module/latest_post');

    $this->data['heading_title'] = $this->language->get('heading_title');

    $this->load->model('bossblog/article');
	 $this->load->model('bossblog/comment');
    $this->load->model('tool/image');

  
    if (empty($setting['limit'])) {
      $setting['limit'] = 5;
    }
	
	        $data = array(
            'order'=> 'date_modified  DESE',

			'start' => 0,

			'limit' =>  $setting['limit']

		);
        
		 $results = $this->model_bossblog_article->getArticles($data);
		 
		foreach ($results as $result) {

			if ($result['image']) {

				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_blog_image_article_width'), $this->config->get('config_blog_image_article_height'));

			} else {

				$image = false;

			}			

			$this->data['articles'][] = array(

				'blog_article_id'  => $result['blog_article_id'],

				'thumb'       => $image,

				'name'        => $result['name'],

                'comment'     => $this->model_bossblog_comment->getTotalCommentsByArticleId($result['blog_article_id']),

                'date_modified'        => $result['date_modified'],

				'title' => html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'),

				'author'      => $result['author'],

				'href'        => $this->url->link('bossblog/article', 'blog_article_id=' . $result['blog_article_id'])

			);

		} 
  

    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest_post.tpl')) {
      $this->template = $this->config->get('config_template') . '/template/module/latest_post.tpl';
    } else {
      $this->template = 'default/template/module/latest_post.tpl';
    }

    $this->render();

    ////////////////////////////////////////////////////

	}
}
?>