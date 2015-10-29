<div class="row issued">
    <div class="col-md-5">
        <div class="thumbnail">
            <figure class="text-center">
                <img class="img-responsive center-block" src="{{ issue_info.skill_badge_image }}" alt="{{ issue_info.skill_name }}">
                <figcaption>
                    <p class="lead">{{ issue_info.skill_name }}</p>
                    {% if issue_info.skill_short_code %}
                        <p>{{ issue_info.skill_short_code }}</p>
                    {% endif %}
                </figcaption>
            </figure>
            <div class="caption">
                {% if issue_info.skill_description %}
                    <p>{{ issue_info.skill_description }}</p>
                {% endif %}
                {% if issue_info.skill_criteria %}
                    <h3>{{ 'CriteriaToEarnTheBadge'|get_lang }}</h3>
                    <p>{{ issue_info.skill_criteria }}</p>
                {% endif %}
            </div>
        </div>
    </div>
    <div class="col-md-7">
        <h3>{{ 'RecipientDetails'|get_lang }}</h3>
        <p class="lead">{{ issue_info.user_complete_name }}</p>
        <h4>{{ 'SkillAcquiredAt'|get_lang }}</h4>
        <ul class="fa-ul">
            <li>
                {% if issue_info.source_name %}
                    <em class="fa-li fa fa-clock-o fa-fw"></em> {{ 'TimeXThroughCourseY'|get_lang|format(issue_info.datetime, issue_info.source_name) }}
                {% else %}
                    <em class="fa-li fa fa-clock-o fa-fw"></em> {{ issue_info.datetime }}
                {% endif %}
                {% if issue_info.argumentation %}
                    <p>{{ issue_info.argumentation }}</p>
                {% endif %}
            </li>
        </ul>
        <hr>
        {% if allow_export %}
            <p class="text-center">
                <a href="#" class="btn btn-success" id="badge-export-button">
                    <em class="fa fa-external-link-square fa-fw"></em> {{ 'ExportBadge'|get_lang }}
                </a>
            </p>
        {% endif %}
    </div>
</div>
{% if allow_export %}
    <script>
        $(document).on('ready', function () {
            $('#badge-export-button').on('click', function (e) {
                e.preventDefault();

                OpenBadges.issue({{ issue_info.badge_asserion|json_encode() }});
            });
        });
    </script>
{% endif %}