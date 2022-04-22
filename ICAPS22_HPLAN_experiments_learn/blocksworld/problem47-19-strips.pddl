( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b606 - block
    b542 - block
    b213 - block
    b882 - block
    b923 - block
    b214 - block
    b679 - block
    b287 - block
    b254 - block
    b252 - block
    b853 - block
    b906 - block
    b660 - block
    b832 - block
    b483 - block
    b775 - block
    b430 - block
    b935 - block
    b902 - block
    b244 - block
    b434 - block
    b350 - block
    b111 - block
    b29 - block
    b33 - block
    b140 - block
    b391 - block
    b273 - block
    b681 - block
    b275 - block
    b854 - block
    b294 - block
    b912 - block
    b61 - block
    b852 - block
    b617 - block
    b171 - block
    b178 - block
    b724 - block
    b20 - block
    b818 - block
    b232 - block
    b367 - block
    b162 - block
    b939 - block
    b487 - block
    b504 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b606 )
    ( on b542 b606 )
    ( on b213 b542 )
    ( on b882 b213 )
    ( on b923 b882 )
    ( on b214 b923 )
    ( on b679 b214 )
    ( on b287 b679 )
    ( on b254 b287 )
    ( on b252 b254 )
    ( on b853 b252 )
    ( on b906 b853 )
    ( on b660 b906 )
    ( on b832 b660 )
    ( on b483 b832 )
    ( on b775 b483 )
    ( on b430 b775 )
    ( on b935 b430 )
    ( on b902 b935 )
    ( on b244 b902 )
    ( on b434 b244 )
    ( on b350 b434 )
    ( on b111 b350 )
    ( on b29 b111 )
    ( on b33 b29 )
    ( on b140 b33 )
    ( on b391 b140 )
    ( on b273 b391 )
    ( on b681 b273 )
    ( on b275 b681 )
    ( on b854 b275 )
    ( on b294 b854 )
    ( on b912 b294 )
    ( on b61 b912 )
    ( on b852 b61 )
    ( on b617 b852 )
    ( on b171 b617 )
    ( on b178 b171 )
    ( on b724 b178 )
    ( on b20 b724 )
    ( on b818 b20 )
    ( on b232 b818 )
    ( on b367 b232 )
    ( on b162 b367 )
    ( on b939 b162 )
    ( on b487 b939 )
    ( on b504 b487 )
    ( on b461 b504 )
    ( clear b461 )
  )
  ( :goal
    ( and
      ( clear b606 )
    )
  )
)
