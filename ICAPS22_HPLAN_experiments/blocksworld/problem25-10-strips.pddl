( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b443 - block
    b391 - block
    b285 - block
    b29 - block
    b899 - block
    b578 - block
    b371 - block
    b831 - block
    b1 - block
    b606 - block
    b262 - block
    b321 - block
    b212 - block
    b360 - block
    b820 - block
    b674 - block
    b249 - block
    b165 - block
    b715 - block
    b964 - block
    b279 - block
    b306 - block
    b56 - block
    b587 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b443 b728 )
    ( on b391 b443 )
    ( on b285 b391 )
    ( on b29 b285 )
    ( on b899 b29 )
    ( on b578 b899 )
    ( on b371 b578 )
    ( on b831 b371 )
    ( on b1 b831 )
    ( on b606 b1 )
    ( on b262 b606 )
    ( on b321 b262 )
    ( on b212 b321 )
    ( on b360 b212 )
    ( on b820 b360 )
    ( on b674 b820 )
    ( on b249 b674 )
    ( on b165 b249 )
    ( on b715 b165 )
    ( on b964 b715 )
    ( on b279 b964 )
    ( on b306 b279 )
    ( on b56 b306 )
    ( on b587 b56 )
    ( on b709 b587 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b728 )
    )
  )
)
