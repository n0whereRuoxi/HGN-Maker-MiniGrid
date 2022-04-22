( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b928 - block
    b100 - block
    b179 - block
    b454 - block
    b596 - block
    b966 - block
    b501 - block
    b585 - block
    b871 - block
    b415 - block
    b152 - block
    b753 - block
    b852 - block
    b773 - block
    b469 - block
    b528 - block
    b850 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b928 )
    ( on b100 b928 )
    ( on b179 b100 )
    ( on b454 b179 )
    ( on b596 b454 )
    ( on b966 b596 )
    ( on b501 b966 )
    ( on b585 b501 )
    ( on b871 b585 )
    ( on b415 b871 )
    ( on b152 b415 )
    ( on b753 b152 )
    ( on b852 b753 )
    ( on b773 b852 )
    ( on b469 b773 )
    ( on b528 b469 )
    ( on b850 b528 )
    ( clear b850 )
  )
  ( :goal
    ( and
      ( clear b928 )
    )
  )
)
