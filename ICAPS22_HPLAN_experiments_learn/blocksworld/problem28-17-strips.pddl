( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b857 - block
    b161 - block
    b883 - block
    b57 - block
    b658 - block
    b686 - block
    b554 - block
    b37 - block
    b314 - block
    b975 - block
    b440 - block
    b36 - block
    b863 - block
    b972 - block
    b542 - block
    b488 - block
    b920 - block
    b35 - block
    b336 - block
    b759 - block
    b635 - block
    b300 - block
    b12 - block
    b904 - block
    b615 - block
    b559 - block
    b345 - block
    b239 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b857 )
    ( on b161 b857 )
    ( on b883 b161 )
    ( on b57 b883 )
    ( on b658 b57 )
    ( on b686 b658 )
    ( on b554 b686 )
    ( on b37 b554 )
    ( on b314 b37 )
    ( on b975 b314 )
    ( on b440 b975 )
    ( on b36 b440 )
    ( on b863 b36 )
    ( on b972 b863 )
    ( on b542 b972 )
    ( on b488 b542 )
    ( on b920 b488 )
    ( on b35 b920 )
    ( on b336 b35 )
    ( on b759 b336 )
    ( on b635 b759 )
    ( on b300 b635 )
    ( on b12 b300 )
    ( on b904 b12 )
    ( on b615 b904 )
    ( on b559 b615 )
    ( on b345 b559 )
    ( on b239 b345 )
    ( on b279 b239 )
    ( clear b279 )
  )
  ( :goal
    ( and
      ( clear b857 )
    )
  )
)
