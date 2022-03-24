( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b628 - block
    b428 - block
    b913 - block
    b467 - block
    b508 - block
    b470 - block
    b724 - block
    b572 - block
    b441 - block
    b587 - block
    b757 - block
    b655 - block
    b247 - block
    b229 - block
    b901 - block
    b179 - block
    b496 - block
    b543 - block
    b634 - block
    b875 - block
    b4 - block
    b731 - block
    b302 - block
    b796 - block
    b852 - block
    b885 - block
    b738 - block
    b398 - block
    b785 - block
    b825 - block
    b646 - block
    b838 - block
    b430 - block
    b614 - block
    b244 - block
    b701 - block
    b766 - block
    b377 - block
    b463 - block
    b663 - block
    b201 - block
    b474 - block
    b199 - block
    b784 - block
    b923 - block
    b695 - block
    b988 - block
    b403 - block
    b367 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b628 b981 )
    ( on b428 b628 )
    ( on b913 b428 )
    ( on b467 b913 )
    ( on b508 b467 )
    ( on b470 b508 )
    ( on b724 b470 )
    ( on b572 b724 )
    ( on b441 b572 )
    ( on b587 b441 )
    ( on b757 b587 )
    ( on b655 b757 )
    ( on b247 b655 )
    ( on b229 b247 )
    ( on b901 b229 )
    ( on b179 b901 )
    ( on b496 b179 )
    ( on b543 b496 )
    ( on b634 b543 )
    ( on b875 b634 )
    ( on b4 b875 )
    ( on b731 b4 )
    ( on b302 b731 )
    ( on b796 b302 )
    ( on b852 b796 )
    ( on b885 b852 )
    ( on b738 b885 )
    ( on b398 b738 )
    ( on b785 b398 )
    ( on b825 b785 )
    ( on b646 b825 )
    ( on b838 b646 )
    ( on b430 b838 )
    ( on b614 b430 )
    ( on b244 b614 )
    ( on b701 b244 )
    ( on b766 b701 )
    ( on b377 b766 )
    ( on b463 b377 )
    ( on b663 b463 )
    ( on b201 b663 )
    ( on b474 b201 )
    ( on b199 b474 )
    ( on b784 b199 )
    ( on b923 b784 )
    ( on b695 b923 )
    ( on b988 b695 )
    ( on b403 b988 )
    ( on b367 b403 )
    ( on b760 b367 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b981 )
    )
  )
)
