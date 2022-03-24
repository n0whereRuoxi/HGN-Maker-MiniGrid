( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b928 - block
    b449 - block
    b838 - block
    b921 - block
    b260 - block
    b152 - block
    b876 - block
    b885 - block
    b264 - block
    b399 - block
    b432 - block
    b322 - block
    b981 - block
    b489 - block
    b671 - block
    b77 - block
    b872 - block
    b952 - block
    b809 - block
    b278 - block
    b371 - block
    b720 - block
    b82 - block
    b581 - block
    b805 - block
    b170 - block
    b893 - block
    b202 - block
    b743 - block
    b10 - block
    b916 - block
    b949 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b928 )
    ( on b449 b928 )
    ( on b838 b449 )
    ( on b921 b838 )
    ( on b260 b921 )
    ( on b152 b260 )
    ( on b876 b152 )
    ( on b885 b876 )
    ( on b264 b885 )
    ( on b399 b264 )
    ( on b432 b399 )
    ( on b322 b432 )
    ( on b981 b322 )
    ( on b489 b981 )
    ( on b671 b489 )
    ( on b77 b671 )
    ( on b872 b77 )
    ( on b952 b872 )
    ( on b809 b952 )
    ( on b278 b809 )
    ( on b371 b278 )
    ( on b720 b371 )
    ( on b82 b720 )
    ( on b581 b82 )
    ( on b805 b581 )
    ( on b170 b805 )
    ( on b893 b170 )
    ( on b202 b893 )
    ( on b743 b202 )
    ( on b10 b743 )
    ( on b916 b10 )
    ( on b949 b916 )
    ( clear b949 )
  )
  ( :tasks
    ( Make-31Pile b449 b838 b921 b260 b152 b876 b885 b264 b399 b432 b322 b981 b489 b671 b77 b872 b952 b809 b278 b371 b720 b82 b581 b805 b170 b893 b202 b743 b10 b916 b949 )
  )
)
