( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b709 - block
    b312 - block
    b640 - block
    b532 - block
    b124 - block
    b385 - block
    b412 - block
    b455 - block
    b249 - block
    b524 - block
    b793 - block
    b870 - block
    b196 - block
    b370 - block
    b372 - block
    b435 - block
    b738 - block
    b56 - block
    b422 - block
    b890 - block
    b358 - block
    b87 - block
    b132 - block
    b313 - block
    b10 - block
    b765 - block
    b862 - block
    b91 - block
    b101 - block
    b651 - block
    b747 - block
    b433 - block
    b324 - block
    b367 - block
    b762 - block
    b395 - block
    b616 - block
    b180 - block
    b784 - block
    b397 - block
    b400 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b709 )
    ( on b312 b709 )
    ( on b640 b312 )
    ( on b532 b640 )
    ( on b124 b532 )
    ( on b385 b124 )
    ( on b412 b385 )
    ( on b455 b412 )
    ( on b249 b455 )
    ( on b524 b249 )
    ( on b793 b524 )
    ( on b870 b793 )
    ( on b196 b870 )
    ( on b370 b196 )
    ( on b372 b370 )
    ( on b435 b372 )
    ( on b738 b435 )
    ( on b56 b738 )
    ( on b422 b56 )
    ( on b890 b422 )
    ( on b358 b890 )
    ( on b87 b358 )
    ( on b132 b87 )
    ( on b313 b132 )
    ( on b10 b313 )
    ( on b765 b10 )
    ( on b862 b765 )
    ( on b91 b862 )
    ( on b101 b91 )
    ( on b651 b101 )
    ( on b747 b651 )
    ( on b433 b747 )
    ( on b324 b433 )
    ( on b367 b324 )
    ( on b762 b367 )
    ( on b395 b762 )
    ( on b616 b395 )
    ( on b180 b616 )
    ( on b784 b180 )
    ( on b397 b784 )
    ( on b400 b397 )
    ( clear b400 )
  )
  ( :goal
    ( and
      ( clear b709 )
    )
  )
)
