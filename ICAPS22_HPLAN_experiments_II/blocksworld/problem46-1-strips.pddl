( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b745 - block
    b853 - block
    b414 - block
    b212 - block
    b747 - block
    b260 - block
    b676 - block
    b388 - block
    b13 - block
    b40 - block
    b287 - block
    b580 - block
    b105 - block
    b432 - block
    b629 - block
    b123 - block
    b839 - block
    b732 - block
    b682 - block
    b269 - block
    b974 - block
    b766 - block
    b85 - block
    b764 - block
    b381 - block
    b365 - block
    b642 - block
    b879 - block
    b907 - block
    b236 - block
    b531 - block
    b464 - block
    b591 - block
    b102 - block
    b62 - block
    b585 - block
    b53 - block
    b360 - block
    b978 - block
    b438 - block
    b92 - block
    b797 - block
    b177 - block
    b505 - block
    b680 - block
    b578 - block
    b566 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b745 )
    ( on b853 b745 )
    ( on b414 b853 )
    ( on b212 b414 )
    ( on b747 b212 )
    ( on b260 b747 )
    ( on b676 b260 )
    ( on b388 b676 )
    ( on b13 b388 )
    ( on b40 b13 )
    ( on b287 b40 )
    ( on b580 b287 )
    ( on b105 b580 )
    ( on b432 b105 )
    ( on b629 b432 )
    ( on b123 b629 )
    ( on b839 b123 )
    ( on b732 b839 )
    ( on b682 b732 )
    ( on b269 b682 )
    ( on b974 b269 )
    ( on b766 b974 )
    ( on b85 b766 )
    ( on b764 b85 )
    ( on b381 b764 )
    ( on b365 b381 )
    ( on b642 b365 )
    ( on b879 b642 )
    ( on b907 b879 )
    ( on b236 b907 )
    ( on b531 b236 )
    ( on b464 b531 )
    ( on b591 b464 )
    ( on b102 b591 )
    ( on b62 b102 )
    ( on b585 b62 )
    ( on b53 b585 )
    ( on b360 b53 )
    ( on b978 b360 )
    ( on b438 b978 )
    ( on b92 b438 )
    ( on b797 b92 )
    ( on b177 b797 )
    ( on b505 b177 )
    ( on b680 b505 )
    ( on b578 b680 )
    ( on b566 b578 )
    ( clear b566 )
  )
  ( :goal
    ( and
      ( clear b745 )
    )
  )
)
