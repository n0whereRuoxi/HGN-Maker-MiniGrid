( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b200 - block
    b826 - block
    b528 - block
    b144 - block
    b62 - block
    b60 - block
    b9 - block
    b602 - block
    b282 - block
    b525 - block
    b865 - block
    b163 - block
    b438 - block
    b677 - block
    b436 - block
    b400 - block
    b709 - block
    b453 - block
    b854 - block
    b127 - block
    b589 - block
    b121 - block
    b913 - block
    b264 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b200 )
    ( on b826 b200 )
    ( on b528 b826 )
    ( on b144 b528 )
    ( on b62 b144 )
    ( on b60 b62 )
    ( on b9 b60 )
    ( on b602 b9 )
    ( on b282 b602 )
    ( on b525 b282 )
    ( on b865 b525 )
    ( on b163 b865 )
    ( on b438 b163 )
    ( on b677 b438 )
    ( on b436 b677 )
    ( on b400 b436 )
    ( on b709 b400 )
    ( on b453 b709 )
    ( on b854 b453 )
    ( on b127 b854 )
    ( on b589 b127 )
    ( on b121 b589 )
    ( on b913 b121 )
    ( on b264 b913 )
    ( on b542 b264 )
    ( clear b542 )
  )
  ( :tasks
    ( Make-24Pile b826 b528 b144 b62 b60 b9 b602 b282 b525 b865 b163 b438 b677 b436 b400 b709 b453 b854 b127 b589 b121 b913 b264 b542 )
  )
)
