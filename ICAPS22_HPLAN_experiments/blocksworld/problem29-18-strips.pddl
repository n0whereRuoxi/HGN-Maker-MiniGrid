( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b96 - block
    b884 - block
    b224 - block
    b373 - block
    b207 - block
    b418 - block
    b17 - block
    b263 - block
    b598 - block
    b792 - block
    b226 - block
    b972 - block
    b197 - block
    b611 - block
    b820 - block
    b498 - block
    b701 - block
    b981 - block
    b709 - block
    b148 - block
    b201 - block
    b68 - block
    b380 - block
    b162 - block
    b724 - block
    b15 - block
    b299 - block
    b616 - block
    b39 - block
    b477 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b96 )
    ( on b884 b96 )
    ( on b224 b884 )
    ( on b373 b224 )
    ( on b207 b373 )
    ( on b418 b207 )
    ( on b17 b418 )
    ( on b263 b17 )
    ( on b598 b263 )
    ( on b792 b598 )
    ( on b226 b792 )
    ( on b972 b226 )
    ( on b197 b972 )
    ( on b611 b197 )
    ( on b820 b611 )
    ( on b498 b820 )
    ( on b701 b498 )
    ( on b981 b701 )
    ( on b709 b981 )
    ( on b148 b709 )
    ( on b201 b148 )
    ( on b68 b201 )
    ( on b380 b68 )
    ( on b162 b380 )
    ( on b724 b162 )
    ( on b15 b724 )
    ( on b299 b15 )
    ( on b616 b299 )
    ( on b39 b616 )
    ( on b477 b39 )
    ( clear b477 )
  )
  ( :goal
    ( and
      ( clear b96 )
    )
  )
)
