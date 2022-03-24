( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b772 - block
    b436 - block
    b535 - block
    b437 - block
    b136 - block
    b332 - block
    b663 - block
    b898 - block
    b765 - block
    b334 - block
    b34 - block
    b853 - block
    b789 - block
    b145 - block
    b283 - block
    b443 - block
    b410 - block
    b668 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b436 b772 )
    ( on b535 b436 )
    ( on b437 b535 )
    ( on b136 b437 )
    ( on b332 b136 )
    ( on b663 b332 )
    ( on b898 b663 )
    ( on b765 b898 )
    ( on b334 b765 )
    ( on b34 b334 )
    ( on b853 b34 )
    ( on b789 b853 )
    ( on b145 b789 )
    ( on b283 b145 )
    ( on b443 b283 )
    ( on b410 b443 )
    ( on b668 b410 )
    ( on b721 b668 )
    ( clear b721 )
  )
  ( :tasks
    ( Make-18Pile b436 b535 b437 b136 b332 b663 b898 b765 b334 b34 b853 b789 b145 b283 b443 b410 b668 b721 )
  )
)
