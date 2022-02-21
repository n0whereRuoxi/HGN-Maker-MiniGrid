( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b925 - block
    b601 - block
    b872 - block
    b397 - block
    b964 - block
    b579 - block
    b600 - block
    b646 - block
    b429 - block
    b145 - block
    b772 - block
    b735 - block
    b470 - block
    b29 - block
    b830 - block
    b917 - block
    b57 - block
    b455 - block
    b316 - block
    b563 - block
    b297 - block
    b442 - block
    b148 - block
    b804 - block
    b244 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b925 )
    ( on b601 b925 )
    ( on b872 b601 )
    ( on b397 b872 )
    ( on b964 b397 )
    ( on b579 b964 )
    ( on b600 b579 )
    ( on b646 b600 )
    ( on b429 b646 )
    ( on b145 b429 )
    ( on b772 b145 )
    ( on b735 b772 )
    ( on b470 b735 )
    ( on b29 b470 )
    ( on b830 b29 )
    ( on b917 b830 )
    ( on b57 b917 )
    ( on b455 b57 )
    ( on b316 b455 )
    ( on b563 b316 )
    ( on b297 b563 )
    ( on b442 b297 )
    ( on b148 b442 )
    ( on b804 b148 )
    ( on b244 b804 )
    ( on b587 b244 )
    ( clear b587 )
  )
  ( :goal
    ( and
      ( clear b925 )
    )
  )
)
