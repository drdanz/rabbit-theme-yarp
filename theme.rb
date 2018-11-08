# -*- coding: utf-8 -*-

#--------------------------------------
# screen and spacing setup
#--------------------------------------
# 4/3 = 1
# 16/9 = 0.75
@yarp_screen_ratio_mult = 4.0 / 3.0 * canvas.height / canvas.width
@space = screen_y(1) * @yarp_screen_ratio_mult
@margin_left = screen_x(3)
@margin_right = screen_x(3)
@margin_top = screen_y(1)
@margin_bottom = screen_y(1)
@slide_footer_info_x_margin ||= screen_x(7)

#--------------------------------------
# font size setup
#--------------------------------------
@xxxx_large_font_size = screen_size(10 * Pango::SCALE * @yarp_screen_ratio_mult)
@xxx_large_font_size = screen_size(8 * Pango::SCALE * @yarp_screen_ratio_mult)
@xx_large_font_size = screen_size(6 * Pango::SCALE * @yarp_screen_ratio_mult)
@x_large_font_size = screen_size(5 * Pango::SCALE * @yarp_screen_ratio_mult)
@large_font_size = screen_size(4.5 * Pango::SCALE * @yarp_screen_ratio_mult)
@normal_font_size = screen_size(3.5 * Pango::SCALE * @yarp_screen_ratio_mult)
@small_font_size = screen_size(3.2  * Pango::SCALE * @yarp_screen_ratio_mult)
@x_small_font_size = screen_size(3 * Pango::SCALE * @yarp_screen_ratio_mult)
@xx_small_font_size = screen_size(2.8 * Pango::SCALE * @yarp_screen_ratio_mult)
@xxx_small_font_size = screen_size(2.5 * Pango::SCALE * @yarp_screen_ratio_mult)
@script_font_size = @xxx_small_font_size
@large_script_font_size = @xx_small_font_size
@x_large_script_font_size = @xsmall_font_size
#--------------------------------------
@title_slide_title_font_size = @xxx_large_font_size
@slide_footer_info_text_size ||= screen_size(1.5 * Pango::SCALE)

#--------------------------------------
# theme colors
#--------------------------------------
@yarp_color_01 = "#1bc2d8"
@yarp_color_01_t = "#1bc2d8cc"
@yarp_color_02 = "#00838f"
@yarp_color_02_t = "#00838fcc"
@yarp_color_03 = "#f6fbfd"
@yarp_color_03_t = "#f6fbfdcc"
@yarp_color_04 = "#d5f2fd"
@yarp_color_04_t = "#d5f2fdcc"

#--------------------------------------
# font family setup
#--------------------------------------
@default_font ||= "Sans"
@font_family = find_font_family(@default_font)
@bold_font ||= "Sans"
@bold_font_family = find_font_family(@bold_font)
@monospace_font ||= "Monospace"
@monospace_font_family = find_font_family(@monospace_font)

#--------------------------------------
# font color setup
#--------------------------------------
@default_emphasis_color ||= @yarp_color_02

#--------------------------------------
# set preformatted text area
#--------------------------------------
@preformatted_frame_color ||= @yarp_color_01
@preformatted_fill_color  ||= @yarp_color_03
@preformatted_shadow_color ||= @yarp_color_02
@preformatted_frame_width ||= 0.5

#--------------------------------------
# set syntax highlightning area
#--------------------------------------
@syntax_highlighting_frame_color ||= @yarp_color_01
@syntax_highlighting_fill_color ||= @yarp_color_03
@syntax_highlighting_shadow_color ||= @yarp_color_02
@syntax_highlighting_frame_width ||= 0.5

#--------------------------------------
# set item marks
#--------------------------------------
@default_item1_mark_type ||= "check"
@default_item1_mark_color ||= @yarp_color_02
@default_item2_mark_color ||= @yarp_color_02
@default_item3_mark_color ||= @yarp_color_02
@default_enum_item1_mark_color ||= @yarp_color_02
@default_enum_item2_mark_color ||= @yarp_color_02
@default_description_item1_mark_color ||= @yarp_color_02
@default_block_quote_item1_mark_color ||= @yarp_color_02

#--------------------------------------
# set blockqoute texts area
#--------------------------------------
@block_quote_frame_color ||= @yarp_color_01
@block_quote_frame_width ||= 0.5
@block_quote_fill_color ||= @yarp_color_03

@block_quote_title_font_size = @x_small_font_size * 0.8
@block_quote_padding_left = screen_x(2)
@block_quote_padding_right = screen_x(2)

#--------------------------------------
# set color of description term underline
#--------------------------------------
@description_term_line_color ||= @yarp_color_01

#--------------------------------------
# set image caption size
#--------------------------------------
# @image_frame_width = 0.0
@image_caption_color = @yarp_color_02
@image_caption_font_size = @xx_small_font_size * 0.8

#--------------------------------------
# setup slide number and timer
#--------------------------------------
@image_slide_number_space_ratio ||= 1.0 / 16.0 * @yarp_screen_ratio_mult
@image_slide_number_start_flag_color ||= @yarp_color_01
@image_slide_number_goal_flag_color ||= @yarp_color_02
@image_slide_number_image ||= "images/yarp-robot-48-transp.png"
@image_timer_space_ratio ||= 1.0 / 16.0 * @yarp_screen_ratio_mult
@image_timer_image ||= "images/yarp-robot-48-grayscale-transp.png"
include_theme("image-slide-number")
include_theme("image-timer")

#--------------------------------------
# set table area
#--------------------------------------
@table_head_frame_color = @yarp_color_01
@table_head_fill_color = @yarp_color_04
@table_body_frame_color = @yarp_color_01
@table_body_fill_color = @yarp_color_03
include_theme("table")

#--------------------------------------
# use default theme
#--------------------------------------
include_theme("default")

#--------------------------------------
# override default theme icon images
#--------------------------------------
@icon_images = ["images/yarp-robot-16.png", "images/yarp-robot-64.png"]
include_theme("icon")

#----------------------------------------
# change reference text style
#----------------------------------------
match("**", ReferText) do |texts|
  texts.prop_set("underline", "none")
  texts.prop_set("foreground", @yarp_color_02)
end

#----------------------------------------
# Load header and footer images
#----------------------------------------
@slide_header ||= "images/top-thin-transp.png"
@slide_header_shadow_height ||= 12
@slide_header_logo_width ||= 87
slide_header_loader = ImageLoader.new(find_file(@slide_header))
slide_header_original_height = slide_header_loader.height
slide_header_original_width = slide_header_loader.width
slide_header_loader.resize(canvas.width, nil)
slide_body_top = slide_header_loader.height - (@slide_header_shadow_height / (slide_header_original_height.to_f / slide_header_loader.height.to_f)).to_i
slide_header_left = (@slide_header_logo_width / (slide_header_original_width.to_f / slide_header_loader.width.to_f)).to_i

@slide_footer ||= "images/bottom-transp.png"
slide_footer_loader = ImageLoader.new(find_file(@slide_footer))
footer_height = canvas.height/26.0 + screen_y(1) * 0.2
slide_footer_loader.resize(canvas.width, footer_height)
slide_body_bottom = footer_height
slide_body_height = canvas.height - slide_body_top - slide_body_bottom

@slide_banner ||= "images/logo-icub.png"
slide_banner_loader = ImageLoader.new(find_file(@slide_banner))
banner_height = canvas.height/26.0
slide_banner_loader.resize(nil, banner_height)
banner_pos_x = canvas.width - slide_banner_loader.width
banner_pos_y = canvas.height - slide_banner_loader.height - footer_height

#----------------------------------------
# Slide Header Settings
#----------------------------------------
# (title only slides - Takahashi method)
@lightning_talk_proc_name ||= "lightning-debian"
@lightning_talk_as_large_as_possible ||= true
@lightning_talk_color ||= @yarp_color_01
@lightning_talk_background_color ||= @yarp_color_03
# @lightning_talk_contact_information ||= "Danz"

include_theme("lightning-talk-toolkit")

match(Slide) do |slides|
  slides.each do |slide|
    if slide.lightning_talk?
      slide.headline.margin_top = 0
      slide.headline.margin_bottom = 0
      slide.headline.margin_left = 0
      slide.headline.margin_right = 0
      slide.headline.prop_set("foreground", @yarp_color_01)
      slide.headline.prop_set("shadow-color", @yarp_color_02)
      slide.lightning_talk
    else
      slide.headline.margin_top = 0
      slide.headline.margin_bottom = 0
      slide.headline.margin_left = slide_header_left
      slide.headline.margin_right = 0
      slide.headline.prop_set("foreground", @yarp_color_03)
      slide.headline.prop_set("size", @x_large_font_size)
      slide.headline.add_pre_draw_proc("header-bg") do |canvas, x, y, w, h, simulation|
        unless simulation
          slide_header_loader.draw(canvas, 0, 0)
        end
        [x, y, w, h]
      end
    end

    # Delete contact information proc (slide-footer-info is used instead)
    delete_post_draw_proc_by_name(@lightning_talk_proc_name)
  end
end


match(Slide, HeadLine) do |heads|
  delete_post_draw_proc_by_name("head-line")
  original_h = nil
  heads.add_pre_draw_proc do |head, canvas, x, y, w, h, simulation|
    original_h = h
    [x, y, w, h]
  end
  heads.add_post_draw_proc do |head, canvas, x, y, w, h, simulation|
    [x, slide_body_top, w, original_h - slide_body_top]
  end
end

# include these again, in order to enable them in title only slides
include_theme("per-slide-background-image")
include_theme("image-slide-number")
include_theme("image-timer")

#----------------------------------------
# Slide Footer settings
#----------------------------------------
match(Slide) do |slides|
  slides.each do |slide|
    slide.add_pre_draw_proc("footer-bg") do |canvas, x, y, w, h, simulation|
      unless simulation
        slide_footer_loader.draw(canvas, 0, canvas.height - footer_height)
        slide_banner_loader.draw(canvas, banner_pos_x, banner_pos_y)
      end
      [x, y, w, h]
    end
  end
end

if @slide_footer_info_right_text.nil?
  if !@lightning_talk_contact_information.nil?
    @slide_footer_info_right_text ||= @lightning_talk_contact_information
  else
    # Try to extract the author from the title slide
    extracted_author = ""
    match(TitleSlide, Author) do |authors|
      authors.each do |author|
        author.text.gsub(/\n/, ' ').split(' ').each do |name|
          unless extracted_author.to_str.strip.empty?
            extracted_author += ' '
          end
          if name.match(/[^<]+@.+\.[^>]+/)
            extracted_author += "&lt;"
            extracted_author += name
            extracted_author += "&gt;"
          else
            extracted_author += name
          end
        end
      end
    end
    @slide_footer_info_right_text ||= extracted_author.to_str
  end
end

@slide_footer_info_base_y ||= canvas.height - footer_height
@slide_footer_info_left_text ||= canvas.title.gsub(/\n/, '')
@slide_footer_info_text_color ||= @yarp_color_03
@slide_footer_info_line_width ||= 0
include_theme("slide-footer-info")

#----------------------------------------
# Slide centering
#----------------------------------------
@slide_centering = true
match(Slide, Body) do |bodies|
  bodies.vertical_centering = @slide_centering
end

#--------------------------------------
# Customize title slide
#--------------------------------------
match(TitleSlide) do |contents|
 contents.prop_set("style", "normal")
end
match(TitleSlide, ContentSource) do |sources|
  sources.margin_bottom = 0
end
match(TitleSlide, Date) do |dates|
  dates.margin_top = @space
end
match(TitleSlide, Place) do |places|
end
match(TitleSlide, Title) do |titles|
  titles.prop_set("foreground", @yarp_color_01)
end

@title_shadow_color ||= @yarp_color_02_t
include_theme("title-shadow")

#--------------------------------------
# set logo in title slide (bottom right)
#--------------------------------------
@title_logo ||= "images/logo-icub.png"
title_logo_loader = ImageLoader.new(find_file(@title_logo))
title_logo_pre_draw_proc = Proc.new do |slide, canvas, x, y, w, h, simulation|
  unless simulation
    draw_x = canvas.width - title_logo_loader.width
    draw_y = canvas.height - title_logo_loader.height
    title_logo_loader.draw(canvas, draw_x, draw_y)
  end
  [x, y, w, h]
end
match(TitleSlide) do |slides|
  name = "title-logo"
  slides.delete_pre_draw_proc_by_name(name)
  slides.add_pre_draw_proc(name, &title_logo_pre_draw_proc)
end

#--------------------------------------
# set title color and background-image
#--------------------------------------
# This is at the end because it has issues with the slide-footer-info theme
@title_background_color ||= @yarp_color_03
include_theme("title-background-color")
# For some reason the background image is not found in subdirectory
@title_background_image ||= File.expand_path(find_file("images/yarp-robot-transp_b-512.png"))
include_theme("title-background-image")
