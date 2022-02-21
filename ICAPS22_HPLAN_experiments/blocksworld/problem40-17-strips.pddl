( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b354 - block
    b444 - block
    b792 - block
    b72 - block
    b82 - block
    b946 - block
    b324 - block
    b507 - block
    b123 - block
    b579 - block
    b827 - block
    b669 - block
    b39 - block
    b540 - block
    b631 - block
    b865 - block
    b230 - block
    b588 - block
    b408 - block
    b452 - block
    b328 - block
    b708 - block
    b211 - block
    b614 - block
    b664 - block
    b784 - block
    b351 - block
    b825 - block
    b776 - block
    b867 - block
    b643 - block
    b518 - block
    b293 - block
    b717 - block
    b315 - block
    b695 - block
    b76 - block
    b364 - block
    b65 - block
    b685 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b354 b216 )
    ( on b444 b354 )
    ( on b792 b444 )
    ( on b72 b792 )
    ( on b82 b72 )
    ( on b946 b82 )
    ( on b324 b946 )
    ( on b507 b324 )
    ( on b123 b507 )
    ( on b579 b123 )
    ( on b827 b579 )
    ( on b669 b827 )
    ( on b39 b669 )
    ( on b540 b39 )
    ( on b631 b540 )
    ( on b865 b631 )
    ( on b230 b865 )
    ( on b588 b230 )
    ( on b408 b588 )
    ( on b452 b408 )
    ( on b328 b452 )
    ( on b708 b328 )
    ( on b211 b708 )
    ( on b614 b211 )
    ( on b664 b614 )
    ( on b784 b664 )
    ( on b351 b784 )
    ( on b825 b351 )
    ( on b776 b825 )
    ( on b867 b776 )
    ( on b643 b867 )
    ( on b518 b643 )
    ( on b293 b518 )
    ( on b717 b293 )
    ( on b315 b717 )
    ( on b695 b315 )
    ( on b76 b695 )
    ( on b364 b76 )
    ( on b65 b364 )
    ( on b685 b65 )
    ( clear b685 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
