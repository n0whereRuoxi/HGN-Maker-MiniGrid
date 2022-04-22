( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b712 - block
    b500 - block
    b504 - block
    b492 - block
    b586 - block
    b796 - block
    b151 - block
    b769 - block
    b544 - block
    b823 - block
    b190 - block
    b215 - block
    b80 - block
    b716 - block
    b142 - block
    b629 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b712 )
    ( on b500 b712 )
    ( on b504 b500 )
    ( on b492 b504 )
    ( on b586 b492 )
    ( on b796 b586 )
    ( on b151 b796 )
    ( on b769 b151 )
    ( on b544 b769 )
    ( on b823 b544 )
    ( on b190 b823 )
    ( on b215 b190 )
    ( on b80 b215 )
    ( on b716 b80 )
    ( on b142 b716 )
    ( on b629 b142 )
    ( clear b629 )
  )
  ( :goal
    ( and
      ( clear b712 )
    )
  )
)
