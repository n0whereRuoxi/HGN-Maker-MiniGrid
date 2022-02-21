( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b211 - block
    b14 - block
    b953 - block
    b654 - block
    b802 - block
    b109 - block
    b196 - block
    b441 - block
    b435 - block
    b67 - block
    b410 - block
    b478 - block
    b678 - block
    b317 - block
    b270 - block
    b601 - block
    b258 - block
    b850 - block
    b23 - block
    b921 - block
    b382 - block
    b227 - block
    b266 - block
    b181 - block
    b188 - block
    b602 - block
    b592 - block
    b309 - block
    b536 - block
    b964 - block
    b553 - block
    b504 - block
    b596 - block
    b895 - block
    b858 - block
    b554 - block
    b480 - block
    b820 - block
    b24 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b211 )
    ( on b14 b211 )
    ( on b953 b14 )
    ( on b654 b953 )
    ( on b802 b654 )
    ( on b109 b802 )
    ( on b196 b109 )
    ( on b441 b196 )
    ( on b435 b441 )
    ( on b67 b435 )
    ( on b410 b67 )
    ( on b478 b410 )
    ( on b678 b478 )
    ( on b317 b678 )
    ( on b270 b317 )
    ( on b601 b270 )
    ( on b258 b601 )
    ( on b850 b258 )
    ( on b23 b850 )
    ( on b921 b23 )
    ( on b382 b921 )
    ( on b227 b382 )
    ( on b266 b227 )
    ( on b181 b266 )
    ( on b188 b181 )
    ( on b602 b188 )
    ( on b592 b602 )
    ( on b309 b592 )
    ( on b536 b309 )
    ( on b964 b536 )
    ( on b553 b964 )
    ( on b504 b553 )
    ( on b596 b504 )
    ( on b895 b596 )
    ( on b858 b895 )
    ( on b554 b858 )
    ( on b480 b554 )
    ( on b820 b480 )
    ( on b24 b820 )
    ( clear b24 )
  )
  ( :goal
    ( and
      ( clear b211 )
    )
  )
)
