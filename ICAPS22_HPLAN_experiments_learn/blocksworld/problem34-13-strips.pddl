( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b707 - block
    b481 - block
    b473 - block
    b844 - block
    b348 - block
    b867 - block
    b770 - block
    b851 - block
    b354 - block
    b108 - block
    b490 - block
    b199 - block
    b894 - block
    b775 - block
    b370 - block
    b816 - block
    b184 - block
    b960 - block
    b393 - block
    b332 - block
    b933 - block
    b78 - block
    b958 - block
    b917 - block
    b431 - block
    b601 - block
    b283 - block
    b180 - block
    b335 - block
    b447 - block
    b664 - block
    b583 - block
    b659 - block
    b344 - block
    b598 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b481 b707 )
    ( on b473 b481 )
    ( on b844 b473 )
    ( on b348 b844 )
    ( on b867 b348 )
    ( on b770 b867 )
    ( on b851 b770 )
    ( on b354 b851 )
    ( on b108 b354 )
    ( on b490 b108 )
    ( on b199 b490 )
    ( on b894 b199 )
    ( on b775 b894 )
    ( on b370 b775 )
    ( on b816 b370 )
    ( on b184 b816 )
    ( on b960 b184 )
    ( on b393 b960 )
    ( on b332 b393 )
    ( on b933 b332 )
    ( on b78 b933 )
    ( on b958 b78 )
    ( on b917 b958 )
    ( on b431 b917 )
    ( on b601 b431 )
    ( on b283 b601 )
    ( on b180 b283 )
    ( on b335 b180 )
    ( on b447 b335 )
    ( on b664 b447 )
    ( on b583 b664 )
    ( on b659 b583 )
    ( on b344 b659 )
    ( on b598 b344 )
    ( clear b598 )
  )
  ( :goal
    ( and
      ( clear b707 )
    )
  )
)
