( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b903 - block
    b77 - block
    b522 - block
    b440 - block
    b21 - block
    b757 - block
    b455 - block
    b100 - block
    b843 - block
    b13 - block
    b778 - block
    b931 - block
    b317 - block
    b383 - block
    b113 - block
    b305 - block
    b994 - block
    b16 - block
    b146 - block
    b710 - block
    b140 - block
    b93 - block
    b574 - block
    b196 - block
    b448 - block
    b354 - block
    b658 - block
    b663 - block
    b277 - block
    b872 - block
    b461 - block
    b211 - block
    b133 - block
    b68 - block
    b65 - block
    b864 - block
    b229 - block
    b900 - block
    b63 - block
    b302 - block
    b543 - block
    b720 - block
    b109 - block
    b769 - block
    b650 - block
    b509 - block
    b598 - block
    b555 - block
    b378 - block
    b464 - block
    b40 - block
    b727 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b903 )
    ( on b77 b903 )
    ( on b522 b77 )
    ( on b440 b522 )
    ( on b21 b440 )
    ( on b757 b21 )
    ( on b455 b757 )
    ( on b100 b455 )
    ( on b843 b100 )
    ( on b13 b843 )
    ( on b778 b13 )
    ( on b931 b778 )
    ( on b317 b931 )
    ( on b383 b317 )
    ( on b113 b383 )
    ( on b305 b113 )
    ( on b994 b305 )
    ( on b16 b994 )
    ( on b146 b16 )
    ( on b710 b146 )
    ( on b140 b710 )
    ( on b93 b140 )
    ( on b574 b93 )
    ( on b196 b574 )
    ( on b448 b196 )
    ( on b354 b448 )
    ( on b658 b354 )
    ( on b663 b658 )
    ( on b277 b663 )
    ( on b872 b277 )
    ( on b461 b872 )
    ( on b211 b461 )
    ( on b133 b211 )
    ( on b68 b133 )
    ( on b65 b68 )
    ( on b864 b65 )
    ( on b229 b864 )
    ( on b900 b229 )
    ( on b63 b900 )
    ( on b302 b63 )
    ( on b543 b302 )
    ( on b720 b543 )
    ( on b109 b720 )
    ( on b769 b109 )
    ( on b650 b769 )
    ( on b509 b650 )
    ( on b598 b509 )
    ( on b555 b598 )
    ( on b378 b555 )
    ( on b464 b378 )
    ( on b40 b464 )
    ( on b727 b40 )
    ( clear b727 )
  )
  ( :goal
    ( and
      ( clear b903 )
    )
  )
)
