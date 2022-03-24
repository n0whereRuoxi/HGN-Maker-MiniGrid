( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b658 - block
    b403 - block
    b98 - block
    b174 - block
    b294 - block
    b42 - block
    b778 - block
    b779 - block
    b479 - block
    b388 - block
    b197 - block
    b743 - block
    b738 - block
    b756 - block
    b87 - block
    b854 - block
    b709 - block
    b184 - block
    b995 - block
    b585 - block
    b275 - block
    b271 - block
    b683 - block
    b433 - block
    b443 - block
    b15 - block
    b226 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b658 )
    ( on b403 b658 )
    ( on b98 b403 )
    ( on b174 b98 )
    ( on b294 b174 )
    ( on b42 b294 )
    ( on b778 b42 )
    ( on b779 b778 )
    ( on b479 b779 )
    ( on b388 b479 )
    ( on b197 b388 )
    ( on b743 b197 )
    ( on b738 b743 )
    ( on b756 b738 )
    ( on b87 b756 )
    ( on b854 b87 )
    ( on b709 b854 )
    ( on b184 b709 )
    ( on b995 b184 )
    ( on b585 b995 )
    ( on b275 b585 )
    ( on b271 b275 )
    ( on b683 b271 )
    ( on b433 b683 )
    ( on b443 b433 )
    ( on b15 b443 )
    ( on b226 b15 )
    ( clear b226 )
  )
  ( :tasks
    ( Make-26Pile b403 b98 b174 b294 b42 b778 b779 b479 b388 b197 b743 b738 b756 b87 b854 b709 b184 b995 b585 b275 b271 b683 b433 b443 b15 b226 )
  )
)
