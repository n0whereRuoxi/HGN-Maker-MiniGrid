( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b30 - block
    b106 - block
    b919 - block
    b422 - block
    b144 - block
    b630 - block
    b98 - block
    b316 - block
    b521 - block
    b591 - block
    b417 - block
    b294 - block
    b927 - block
    b122 - block
    b862 - block
    b67 - block
    b262 - block
    b274 - block
    b762 - block
    b701 - block
    b435 - block
    b975 - block
    b570 - block
    b31 - block
    b879 - block
    b226 - block
    b213 - block
    b642 - block
    b751 - block
    b509 - block
    b165 - block
    b809 - block
    b181 - block
    b808 - block
    b172 - block
    b380 - block
    b780 - block
    b781 - block
    b881 - block
    b868 - block
    b685 - block
    b948 - block
    b645 - block
    b403 - block
    b423 - block
    b504 - block
    b143 - block
    b131 - block
    b281 - block
    b77 - block
    b335 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b30 )
    ( on b106 b30 )
    ( on b919 b106 )
    ( on b422 b919 )
    ( on b144 b422 )
    ( on b630 b144 )
    ( on b98 b630 )
    ( on b316 b98 )
    ( on b521 b316 )
    ( on b591 b521 )
    ( on b417 b591 )
    ( on b294 b417 )
    ( on b927 b294 )
    ( on b122 b927 )
    ( on b862 b122 )
    ( on b67 b862 )
    ( on b262 b67 )
    ( on b274 b262 )
    ( on b762 b274 )
    ( on b701 b762 )
    ( on b435 b701 )
    ( on b975 b435 )
    ( on b570 b975 )
    ( on b31 b570 )
    ( on b879 b31 )
    ( on b226 b879 )
    ( on b213 b226 )
    ( on b642 b213 )
    ( on b751 b642 )
    ( on b509 b751 )
    ( on b165 b509 )
    ( on b809 b165 )
    ( on b181 b809 )
    ( on b808 b181 )
    ( on b172 b808 )
    ( on b380 b172 )
    ( on b780 b380 )
    ( on b781 b780 )
    ( on b881 b781 )
    ( on b868 b881 )
    ( on b685 b868 )
    ( on b948 b685 )
    ( on b645 b948 )
    ( on b403 b645 )
    ( on b423 b403 )
    ( on b504 b423 )
    ( on b143 b504 )
    ( on b131 b143 )
    ( on b281 b131 )
    ( on b77 b281 )
    ( on b335 b77 )
    ( clear b335 )
  )
  ( :tasks
    ( Make-50Pile b106 b919 b422 b144 b630 b98 b316 b521 b591 b417 b294 b927 b122 b862 b67 b262 b274 b762 b701 b435 b975 b570 b31 b879 b226 b213 b642 b751 b509 b165 b809 b181 b808 b172 b380 b780 b781 b881 b868 b685 b948 b645 b403 b423 b504 b143 b131 b281 b77 b335 )
  )
)
