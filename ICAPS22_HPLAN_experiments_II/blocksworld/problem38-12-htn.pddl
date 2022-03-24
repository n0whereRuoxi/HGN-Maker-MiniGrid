( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b74 - block
    b250 - block
    b765 - block
    b430 - block
    b578 - block
    b13 - block
    b425 - block
    b12 - block
    b948 - block
    b901 - block
    b942 - block
    b546 - block
    b532 - block
    b45 - block
    b674 - block
    b70 - block
    b913 - block
    b841 - block
    b821 - block
    b135 - block
    b667 - block
    b273 - block
    b818 - block
    b438 - block
    b393 - block
    b306 - block
    b94 - block
    b244 - block
    b316 - block
    b114 - block
    b657 - block
    b612 - block
    b140 - block
    b501 - block
    b865 - block
    b871 - block
    b412 - block
    b406 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b74 )
    ( on b250 b74 )
    ( on b765 b250 )
    ( on b430 b765 )
    ( on b578 b430 )
    ( on b13 b578 )
    ( on b425 b13 )
    ( on b12 b425 )
    ( on b948 b12 )
    ( on b901 b948 )
    ( on b942 b901 )
    ( on b546 b942 )
    ( on b532 b546 )
    ( on b45 b532 )
    ( on b674 b45 )
    ( on b70 b674 )
    ( on b913 b70 )
    ( on b841 b913 )
    ( on b821 b841 )
    ( on b135 b821 )
    ( on b667 b135 )
    ( on b273 b667 )
    ( on b818 b273 )
    ( on b438 b818 )
    ( on b393 b438 )
    ( on b306 b393 )
    ( on b94 b306 )
    ( on b244 b94 )
    ( on b316 b244 )
    ( on b114 b316 )
    ( on b657 b114 )
    ( on b612 b657 )
    ( on b140 b612 )
    ( on b501 b140 )
    ( on b865 b501 )
    ( on b871 b865 )
    ( on b412 b871 )
    ( on b406 b412 )
    ( on b440 b406 )
    ( clear b440 )
  )
  ( :tasks
    ( Make-38Pile b250 b765 b430 b578 b13 b425 b12 b948 b901 b942 b546 b532 b45 b674 b70 b913 b841 b821 b135 b667 b273 b818 b438 b393 b306 b94 b244 b316 b114 b657 b612 b140 b501 b865 b871 b412 b406 b440 )
  )
)
