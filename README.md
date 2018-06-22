# Футбольное сообщество

Мне нравится идея реддита. Открытое комьюнити, где люди могут обсудить любую новость. Кажется, что нашему футбольному сообществу такой вещи как раз и не хватает. Многие сайты ориентируются не на болельщика, а на количество просмотров. Это плохо, но это возможно поменять, если создать для фанатов специальную площадку, где им будет удобно получать новую информацию и комфорнтно обсуждать новости.

**Парсер**

В начале, когда активных пользователей не так много, необходимо было придумать решение, которое позволит наполнить сайт - быстро и эффективно. 

Чтобы не ходить по всем топовым сайтам и не добавлять в ручную интересные ссылки, я написал парсер. 

```ruby
def parse
	@categories = Category.all
	require 'open-uri'
	require 'nokogiri'
	require 'json'

	url_ua_football = 'https://www.ua-football.com/'
	html_ua_football = open(url_ua_football)

	doc_ua_football = Nokogiri::HTML(html_ua_football)
	@ua_football = []
	doc_ua_football.css('#allnews li').each do |showing|
		title_el = showing.at_css('a')
		title = title_el.text.strip
		link = showing.at_css('a').attr('href')
		@ua_football.push(
			title: title,
			link: link,
		)
	end
end
```