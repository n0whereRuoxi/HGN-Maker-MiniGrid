( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b105 - block
    b814 - block
    b380 - block
    b649 - block
    b816 - block
    b342 - block
    b656 - block
    b260 - block
    b722 - block
    b804 - block
    b997 - block
    b389 - block
    b885 - block
    b20 - block
    b578 - block
    b678 - block
    b764 - block
    b135 - block
    b383 - block
    b131 - block
    b743 - block
    b606 - block
    b96 - block
    b689 - block
    b820 - block
    b124 - block
    b472 - block
    b785 - block
    b911 - block
    b899 - block
    b695 - block
    b932 - block
    b253 - block
    b315 - block
    b569 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b105 b324 )
    ( on b814 b105 )
    ( on b380 b814 )
    ( on b649 b380 )
    ( on b816 b649 )
    ( on b342 b816 )
    ( on b656 b342 )
    ( on b260 b656 )
    ( on b722 b260 )
    ( on b804 b722 )
    ( on b997 b804 )
    ( on b389 b997 )
    ( on b885 b389 )
    ( on b20 b885 )
    ( on b578 b20 )
    ( on b678 b578 )
    ( on b764 b678 )
    ( on b135 b764 )
    ( on b383 b135 )
    ( on b131 b383 )
    ( on b743 b131 )
    ( on b606 b743 )
    ( on b96 b606 )
    ( on b689 b96 )
    ( on b820 b689 )
    ( on b124 b820 )
    ( on b472 b124 )
    ( on b785 b472 )
    ( on b911 b785 )
    ( on b899 b911 )
    ( on b695 b899 )
    ( on b932 b695 )
    ( on b253 b932 )
    ( on b315 b253 )
    ( on b569 b315 )
    ( on b571 b569 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
