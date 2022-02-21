( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b377 - block
    b432 - block
    b169 - block
    b637 - block
    b989 - block
    b529 - block
    b620 - block
    b605 - block
    b378 - block
    b447 - block
    b722 - block
    b60 - block
    b887 - block
    b797 - block
    b749 - block
    b880 - block
    b182 - block
    b219 - block
    b458 - block
    b413 - block
    b566 - block
    b778 - block
    b180 - block
    b680 - block
    b660 - block
    b497 - block
    b676 - block
    b212 - block
    b916 - block
    b100 - block
    b30 - block
    b249 - block
    b319 - block
    b356 - block
    b506 - block
    b389 - block
    b691 - block
    b326 - block
    b483 - block
    b267 - block
    b889 - block
    b162 - block
    b573 - block
    b477 - block
    b964 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b377 )
    ( on b432 b377 )
    ( on b169 b432 )
    ( on b637 b169 )
    ( on b989 b637 )
    ( on b529 b989 )
    ( on b620 b529 )
    ( on b605 b620 )
    ( on b378 b605 )
    ( on b447 b378 )
    ( on b722 b447 )
    ( on b60 b722 )
    ( on b887 b60 )
    ( on b797 b887 )
    ( on b749 b797 )
    ( on b880 b749 )
    ( on b182 b880 )
    ( on b219 b182 )
    ( on b458 b219 )
    ( on b413 b458 )
    ( on b566 b413 )
    ( on b778 b566 )
    ( on b180 b778 )
    ( on b680 b180 )
    ( on b660 b680 )
    ( on b497 b660 )
    ( on b676 b497 )
    ( on b212 b676 )
    ( on b916 b212 )
    ( on b100 b916 )
    ( on b30 b100 )
    ( on b249 b30 )
    ( on b319 b249 )
    ( on b356 b319 )
    ( on b506 b356 )
    ( on b389 b506 )
    ( on b691 b389 )
    ( on b326 b691 )
    ( on b483 b326 )
    ( on b267 b483 )
    ( on b889 b267 )
    ( on b162 b889 )
    ( on b573 b162 )
    ( on b477 b573 )
    ( on b964 b477 )
    ( clear b964 )
  )
  ( :goal
    ( and
      ( clear b377 )
    )
  )
)
