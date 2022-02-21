( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b917 - block
    b224 - block
    b971 - block
    b424 - block
    b111 - block
    b709 - block
    b696 - block
    b732 - block
    b160 - block
    b462 - block
    b892 - block
    b33 - block
    b251 - block
    b851 - block
    b525 - block
    b79 - block
    b100 - block
    b228 - block
    b397 - block
    b819 - block
    b882 - block
    b109 - block
    b772 - block
    b67 - block
    b186 - block
    b600 - block
    b494 - block
    b219 - block
    b398 - block
    b638 - block
    b976 - block
    b855 - block
    b667 - block
    b907 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b917 b965 )
    ( on b224 b917 )
    ( on b971 b224 )
    ( on b424 b971 )
    ( on b111 b424 )
    ( on b709 b111 )
    ( on b696 b709 )
    ( on b732 b696 )
    ( on b160 b732 )
    ( on b462 b160 )
    ( on b892 b462 )
    ( on b33 b892 )
    ( on b251 b33 )
    ( on b851 b251 )
    ( on b525 b851 )
    ( on b79 b525 )
    ( on b100 b79 )
    ( on b228 b100 )
    ( on b397 b228 )
    ( on b819 b397 )
    ( on b882 b819 )
    ( on b109 b882 )
    ( on b772 b109 )
    ( on b67 b772 )
    ( on b186 b67 )
    ( on b600 b186 )
    ( on b494 b600 )
    ( on b219 b494 )
    ( on b398 b219 )
    ( on b638 b398 )
    ( on b976 b638 )
    ( on b855 b976 )
    ( on b667 b855 )
    ( on b907 b667 )
    ( clear b907 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
