( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b150 - block
    b469 - block
    b203 - block
    b789 - block
    b63 - block
    b234 - block
    b653 - block
    b710 - block
    b765 - block
    b192 - block
    b123 - block
    b317 - block
    b657 - block
    b994 - block
    b813 - block
    b310 - block
    b351 - block
    b961 - block
    b840 - block
    b949 - block
    b976 - block
    b876 - block
    b816 - block
    b770 - block
    b875 - block
    b207 - block
    b750 - block
    b178 - block
    b324 - block
    b496 - block
    b822 - block
    b694 - block
    b999 - block
    b688 - block
    b274 - block
    b110 - block
    b125 - block
    b702 - block
    b608 - block
    b198 - block
    b758 - block
    b795 - block
    b417 - block
    b421 - block
    b864 - block
    b904 - block
    b923 - block
    b551 - block
    b745 - block
    b538 - block
    b521 - block
    b386 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b150 )
    ( on b469 b150 )
    ( on b203 b469 )
    ( on b789 b203 )
    ( on b63 b789 )
    ( on b234 b63 )
    ( on b653 b234 )
    ( on b710 b653 )
    ( on b765 b710 )
    ( on b192 b765 )
    ( on b123 b192 )
    ( on b317 b123 )
    ( on b657 b317 )
    ( on b994 b657 )
    ( on b813 b994 )
    ( on b310 b813 )
    ( on b351 b310 )
    ( on b961 b351 )
    ( on b840 b961 )
    ( on b949 b840 )
    ( on b976 b949 )
    ( on b876 b976 )
    ( on b816 b876 )
    ( on b770 b816 )
    ( on b875 b770 )
    ( on b207 b875 )
    ( on b750 b207 )
    ( on b178 b750 )
    ( on b324 b178 )
    ( on b496 b324 )
    ( on b822 b496 )
    ( on b694 b822 )
    ( on b999 b694 )
    ( on b688 b999 )
    ( on b274 b688 )
    ( on b110 b274 )
    ( on b125 b110 )
    ( on b702 b125 )
    ( on b608 b702 )
    ( on b198 b608 )
    ( on b758 b198 )
    ( on b795 b758 )
    ( on b417 b795 )
    ( on b421 b417 )
    ( on b864 b421 )
    ( on b904 b864 )
    ( on b923 b904 )
    ( on b551 b923 )
    ( on b745 b551 )
    ( on b538 b745 )
    ( on b521 b538 )
    ( on b386 b521 )
    ( clear b386 )
  )
  ( :goal
    ( and
      ( clear b150 )
    )
  )
)
