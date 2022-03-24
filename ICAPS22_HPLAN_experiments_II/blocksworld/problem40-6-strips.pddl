( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b122 - block
    b976 - block
    b190 - block
    b419 - block
    b138 - block
    b552 - block
    b436 - block
    b60 - block
    b714 - block
    b654 - block
    b869 - block
    b921 - block
    b220 - block
    b215 - block
    b651 - block
    b314 - block
    b16 - block
    b143 - block
    b461 - block
    b486 - block
    b621 - block
    b581 - block
    b749 - block
    b817 - block
    b844 - block
    b860 - block
    b356 - block
    b531 - block
    b796 - block
    b996 - block
    b426 - block
    b284 - block
    b815 - block
    b709 - block
    b736 - block
    b518 - block
    b388 - block
    b336 - block
    b677 - block
    b255 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b122 )
    ( on b976 b122 )
    ( on b190 b976 )
    ( on b419 b190 )
    ( on b138 b419 )
    ( on b552 b138 )
    ( on b436 b552 )
    ( on b60 b436 )
    ( on b714 b60 )
    ( on b654 b714 )
    ( on b869 b654 )
    ( on b921 b869 )
    ( on b220 b921 )
    ( on b215 b220 )
    ( on b651 b215 )
    ( on b314 b651 )
    ( on b16 b314 )
    ( on b143 b16 )
    ( on b461 b143 )
    ( on b486 b461 )
    ( on b621 b486 )
    ( on b581 b621 )
    ( on b749 b581 )
    ( on b817 b749 )
    ( on b844 b817 )
    ( on b860 b844 )
    ( on b356 b860 )
    ( on b531 b356 )
    ( on b796 b531 )
    ( on b996 b796 )
    ( on b426 b996 )
    ( on b284 b426 )
    ( on b815 b284 )
    ( on b709 b815 )
    ( on b736 b709 )
    ( on b518 b736 )
    ( on b388 b518 )
    ( on b336 b388 )
    ( on b677 b336 )
    ( on b255 b677 )
    ( on b365 b255 )
    ( clear b365 )
  )
  ( :goal
    ( and
      ( clear b122 )
    )
  )
)
