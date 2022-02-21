( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b56 - block
    b732 - block
    b341 - block
    b925 - block
    b323 - block
    b899 - block
    b12 - block
    b41 - block
    b937 - block
    b260 - block
    b189 - block
    b492 - block
    b220 - block
    b307 - block
    b434 - block
    b430 - block
    b37 - block
    b317 - block
    b896 - block
    b125 - block
    b585 - block
    b123 - block
    b416 - block
    b953 - block
    b330 - block
    b329 - block
    b376 - block
    b791 - block
    b605 - block
    b762 - block
    b895 - block
    b920 - block
    b446 - block
    b316 - block
    b963 - block
    b538 - block
    b515 - block
    b944 - block
    b527 - block
    b357 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b56 )
    ( on b732 b56 )
    ( on b341 b732 )
    ( on b925 b341 )
    ( on b323 b925 )
    ( on b899 b323 )
    ( on b12 b899 )
    ( on b41 b12 )
    ( on b937 b41 )
    ( on b260 b937 )
    ( on b189 b260 )
    ( on b492 b189 )
    ( on b220 b492 )
    ( on b307 b220 )
    ( on b434 b307 )
    ( on b430 b434 )
    ( on b37 b430 )
    ( on b317 b37 )
    ( on b896 b317 )
    ( on b125 b896 )
    ( on b585 b125 )
    ( on b123 b585 )
    ( on b416 b123 )
    ( on b953 b416 )
    ( on b330 b953 )
    ( on b329 b330 )
    ( on b376 b329 )
    ( on b791 b376 )
    ( on b605 b791 )
    ( on b762 b605 )
    ( on b895 b762 )
    ( on b920 b895 )
    ( on b446 b920 )
    ( on b316 b446 )
    ( on b963 b316 )
    ( on b538 b963 )
    ( on b515 b538 )
    ( on b944 b515 )
    ( on b527 b944 )
    ( on b357 b527 )
    ( on b222 b357 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b56 )
    )
  )
)
