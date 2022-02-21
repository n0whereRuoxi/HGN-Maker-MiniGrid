( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b514 - block
    b800 - block
    b370 - block
    b2 - block
    b995 - block
    b452 - block
    b528 - block
    b413 - block
    b458 - block
    b443 - block
    b549 - block
    b598 - block
    b391 - block
    b834 - block
    b707 - block
    b503 - block
    b494 - block
    b126 - block
    b518 - block
    b149 - block
    b373 - block
    b180 - block
    b153 - block
    b577 - block
    b962 - block
    b321 - block
    b113 - block
    b975 - block
    b663 - block
    b110 - block
    b181 - block
    b476 - block
    b319 - block
    b84 - block
    b573 - block
    b187 - block
    b316 - block
    b808 - block
    b297 - block
    b435 - block
    b460 - block
    b725 - block
    b336 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b514 )
    ( on b800 b514 )
    ( on b370 b800 )
    ( on b2 b370 )
    ( on b995 b2 )
    ( on b452 b995 )
    ( on b528 b452 )
    ( on b413 b528 )
    ( on b458 b413 )
    ( on b443 b458 )
    ( on b549 b443 )
    ( on b598 b549 )
    ( on b391 b598 )
    ( on b834 b391 )
    ( on b707 b834 )
    ( on b503 b707 )
    ( on b494 b503 )
    ( on b126 b494 )
    ( on b518 b126 )
    ( on b149 b518 )
    ( on b373 b149 )
    ( on b180 b373 )
    ( on b153 b180 )
    ( on b577 b153 )
    ( on b962 b577 )
    ( on b321 b962 )
    ( on b113 b321 )
    ( on b975 b113 )
    ( on b663 b975 )
    ( on b110 b663 )
    ( on b181 b110 )
    ( on b476 b181 )
    ( on b319 b476 )
    ( on b84 b319 )
    ( on b573 b84 )
    ( on b187 b573 )
    ( on b316 b187 )
    ( on b808 b316 )
    ( on b297 b808 )
    ( on b435 b297 )
    ( on b460 b435 )
    ( on b725 b460 )
    ( on b336 b725 )
    ( clear b336 )
  )
  ( :goal
    ( and
      ( clear b514 )
    )
  )
)
