Page.delete_all
PortfolioItem.delete_all
Image.delete_all
Admin.delete_all

admin = Admin.create(email: "vincent@stoop.nl", password: "abcd1234", password_confirmation: "abcd1234")



PortfolioItem.create!(title: "PortfolioItem 1", body: "Echo park chia pour-over, tattooed keffiyeh letterpress franzen hella enamel pin slow-carb. Subway tile you probably haven't heard of them paleo marfa dreamcatcher. Tousled af whatever everyday carry heirloom. Jianbing bitters direct trade, ethical gentrify pop-up semiotics copper mug fap try-hard umami deep v hell of chicharrones. Succulents salvia cred, ramps swag freegan affogato kogi offal cronut gastropub hell of aesthetic fixie ugh. Cold-pressed mlkshk synth hell of. Put a bird on it bicycle rights live-edge drinking vinegar, YOLO crucifix banh mi VHS.", published: true, admin: admin)
PortfolioItem.create!(title: "PortfolioItem 2", body: "Spicy jalapeno bacon ipsum dolor amet doner hamburger t-bone proident, porchetta tri-tip eu short ribs ullamco incididunt voluptate minim exercitation shoulder chuck. Qui ham irure pig, pancetta chicken adipisicing labore short ribs quis meatloaf minim flank. Ut tenderloin ex lorem strip steak enim fatback cupim. Ground round pork qui, kevin nostrud id flank pariatur ad pork loin pork chop chicken.", published: true, images: [Image.create(title: "test")], admin: admin)

Page.create!(title: "Page 1", body: "Echo park chia pour-over, tattooed keffiyeh letterpress franzen hella enamel pin slow-carb. Subway tile you probably haven't heard of them paleo marfa dreamcatcher. Tousled af whatever everyday carry heirloom. Jianbing bitters direct trade, ethical gentrify pop-up semiotics copper mug fap try-hard umami deep v hell of chicharrones. Succulents salvia cred, ramps swag freegan affogato kogi offal cronut gastropub hell of aesthetic fixie ugh. Cold-pressed mlkshk synth hell of. Put a bird on it bicycle rights live-edge drinking vinegar, YOLO crucifix banh mi VHS.", published: true, admin: admin)
Page.create!(title: "Page 2", body: "Tongue salami turducken aliqua duis pork loin, prosciutto deserunt adipisicing ex kevin ribeye corned beef alcatra. Tail ham hock ea fugiat aliqua, laborum pork chop chicken. Ball tip filet mignon occaecat ribeye est meatloaf sed hamburger esse corned beef proident pig tri-tip. Strip steak ex jowl mollit incididunt aute ball tip nulla cillum chuck spare ribs beef. Sint ribeye consequat jerky minim in occaecat dolore laborum chicken. Jerky non laboris chicken, rump id aute.", published: true, admin: admin)
