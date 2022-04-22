( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b691 - block
    b113 - block
    b873 - block
    b777 - block
    b320 - block
    b657 - block
    b734 - block
    b859 - block
    b565 - block
    b926 - block
    b745 - block
    b950 - block
    b491 - block
    b356 - block
    b375 - block
    b614 - block
    b891 - block
    b37 - block
    b410 - block
    b943 - block
    b649 - block
    b602 - block
    b470 - block
    b561 - block
    b166 - block
    b794 - block
    b442 - block
    b538 - block
    b523 - block
    b557 - block
    b284 - block
    b949 - block
    b203 - block
    b378 - block
    b877 - block
    b299 - block
    b195 - block
    b219 - block
    b742 - block
    b553 - block
    b940 - block
    b157 - block
    b348 - block
    b392 - block
    b109 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b691 )
    ( on b113 b691 )
    ( on b873 b113 )
    ( on b777 b873 )
    ( on b320 b777 )
    ( on b657 b320 )
    ( on b734 b657 )
    ( on b859 b734 )
    ( on b565 b859 )
    ( on b926 b565 )
    ( on b745 b926 )
    ( on b950 b745 )
    ( on b491 b950 )
    ( on b356 b491 )
    ( on b375 b356 )
    ( on b614 b375 )
    ( on b891 b614 )
    ( on b37 b891 )
    ( on b410 b37 )
    ( on b943 b410 )
    ( on b649 b943 )
    ( on b602 b649 )
    ( on b470 b602 )
    ( on b561 b470 )
    ( on b166 b561 )
    ( on b794 b166 )
    ( on b442 b794 )
    ( on b538 b442 )
    ( on b523 b538 )
    ( on b557 b523 )
    ( on b284 b557 )
    ( on b949 b284 )
    ( on b203 b949 )
    ( on b378 b203 )
    ( on b877 b378 )
    ( on b299 b877 )
    ( on b195 b299 )
    ( on b219 b195 )
    ( on b742 b219 )
    ( on b553 b742 )
    ( on b940 b553 )
    ( on b157 b940 )
    ( on b348 b157 )
    ( on b392 b348 )
    ( on b109 b392 )
    ( clear b109 )
  )
  ( :goal
    ( and
      ( clear b691 )
    )
  )
)
